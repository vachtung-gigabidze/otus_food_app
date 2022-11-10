import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:otus_food_app/constants.dart';
import 'package:otus_food_app/feature/recipe_list/domain/entities/recipe_entity.dart';
import 'package:otus_food_app/feature/recipe_list/ui/components/detail/heart.dart';
import 'package:otus_food_app/screens/gallery_screen.dart';
import 'package:otus_food_app/screens/test.dart';
import 'package:otus_food_app/utils/recipe_utils.dart';

class HeaderDetail extends StatefulWidget {
  const HeaderDetail({Key? key, required this.recipe}) : super(key: key);

  final Recipe recipe;

  @override
  State<HeaderDetail> createState() => _HeaderDetailState();
}

class _HeaderDetailState extends State<HeaderDetail> {
  late bool isFavorites;
  late Recipe recipe;
  String username = 'anonymous';
  @override
  void initState() {
    super.initState();
    recipe = widget.recipe;
    isFavorites = false; //recipe.isFavorite(username);
    // TODO: Отметка любимого рецепта
  }

  void openGalleryPage() {
    Navigator.of(context).push(MaterialPageRoute(
        // builder: (context) => SaveImageSQLite(recipeId: recipe.id)));
        builder: (context) => TestTensorFlow()));
  }

  @override
  Widget build(BuildContext context) {
    //var recept = widget.snapshot.data;

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
              // height: 31,
              // width: 314,
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
            Flexible(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.only(right: 20),
                child: InkWell(
                  onTap: () => setState(() {
                    isFavorites =
                        !isFavorites; // recipe.changeFavorite(isFavorites, username);
                    // TODO: Отметка любимого рецепта
                  }),
                  child: isFavorites
                      ? const HeartWidget() //asset: Constants.iconHeartRed)
                      : Image.asset(
                          Constants.iconHeartBlack,
                          height: 30,
                          width: 30,
                        ),

                  //Image.asset(
                  // isFavorites
                  //     ? Constants.iconHeartRed
                  //     : Constants.iconHeartBlack,
                  // height: 30,
                  // width: 30,
                  //  ),
                ),
              ),
            ),
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
              bottom: 13.9,
              right: 0,
              child: Image(
                image: AssetImage(Constants.flagIcon),
                height: 43,
                width: 66,
                fit: BoxFit.cover,
              ),
            ),
          if (isFavorites)
            Positioned(
              bottom: 30,
              right: 7,
              child: Text(
                '${recipe.favoriteRecipes!.length}',
                style: const TextStyle(
                  fontFamily: 'Roboto',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w800,
                  fontSize: 18.0,
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
