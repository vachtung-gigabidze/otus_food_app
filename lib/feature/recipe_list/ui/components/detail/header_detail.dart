import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otus_food_app/constants.dart';
import 'package:otus_food_app/feature/recipe_list/domain/entities/recipe_entity.dart';
import 'package:otus_food_app/feature/recipe_list/domain/recipe_list_state/recipe_list_cubit.dart';
import 'package:otus_food_app/feature/recipe_list/ui/components/detail/heart.dart';
import 'package:otus_food_app/screens/gallery_screen.dart';
import 'package:otus_food_app/utils/recipe_utils.dart';
import 'package:otus_food_app/feature/auth/domain/auth_state/auth_cubit.dart';

class HeaderDetail extends StatefulWidget {
  const HeaderDetail({Key? key, required this.recipe, required this.userId})
      : super(key: key);

  final Recipe recipe;
  final int userId;

  @override
  State<HeaderDetail> createState() => _HeaderDetailState();
}

class _HeaderDetailState extends State<HeaderDetail> {
  late bool isFavorites;
  late Recipe recipe;
  String username = 'anonymous';
  @override
  void initState() {
    recipe = widget.recipe;
    isFavorites = recipe.isFavorite(widget.userId);
    super.initState();
    //
  }

  heartCallback(String userId) {
    isFavorites = !isFavorites;
    if (isFavorites) {
      _addFavorite(int.parse(userId), recipe.id!);
    } else {
      _deleteFavorite(recipe.findFavorite(userId: int.parse(userId))!);
    }
  }

  void _addFavorite(int userId, int recipeId) async {
    final id = await context
        .read<RecipeListCubit>()
        .createFavorite(User(id: userId), Recipe(id: recipeId));

    setState(() {
      recipe.favoriteRecipes?.add(Favorite(
          id: id, user: User(id: userId), recipe: Recipe(id: recipeId)));
    });
  }

  void _deleteFavorite(Favorite favorite) {
    context.read<RecipeListCubit>().deleteFavorite(favorite.id ?? 0);
    setState(() {
      recipe.favoriteRecipes?.remove(favorite);
    });
  }

  void openGalleryPage() {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => SaveImageSQLite(recipeId: recipe.id)));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              fit: FlexFit.tight,
              flex: 5,
              child: Text(
                recipe.name ?? "Название рецепта",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontFamily: 'Roboto',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w600,
                  fontSize: 24.0,
                  color: Colors.black87,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
              return state.maybeWhen(
                authorized: (userEntity) {
                  return Flexible(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.only(right: 20),
                      child: HeartWidget(
                        animate: isFavorites,
                        heatTap: heartCallback(userEntity.id),
                      ),
                    ),
                  );
                },
                orElse: () => Container(),
              );
            }),
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        Row(
          children: [
            const Image(
              image: AssetImage(Constants.iconClock),
              height: 16,
              width: 16,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: 11,
            ),
            Text(
              RecipeUtils.nameTime(recipe.duration!),
              style: const TextStyle(
                fontFamily: 'Roboto',
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w400,
                fontSize: 16.0,
                color: Color(0xFF2ECC71),
                decoration: TextDecoration.none,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        Stack(children: [
          CachedNetworkImage(
            imageUrl: recipe.photo!,
          ),
          if (isFavorites)
            const Positioned(
              bottom: 13.46,
              right: 0,
              child: Image(
                image: AssetImage(Constants.flagIcon),
                height: 23,
                width: 66,
                fit: BoxFit.fill,
              ),
            ),
          if (isFavorites)
            Positioned(
              bottom: 17.46,
              right: 7,
              child: Text(
                '${recipe.favoriteRecipes!.length}',
                style: const TextStyle(
                  fontFamily: 'Roboto',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w800,
                  fontSize: 14.0,
                  color: Color(0xFFFFFFFF),
                ),
              ),
            ),
          Positioned(
            bottom: 10,
            left: 7,
            child: IconButton(
                onPressed: () => openGalleryPage(),
                iconSize: 32,
                icon: const Icon(
                  Icons.image,
                  color: Colors.white,
                )),
          )
        ]),
      ],
    );
  }
}
