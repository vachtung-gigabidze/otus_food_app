import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otus_food_app/feature/recipe_list/domain/entities/recipe_entity.dart';
import 'package:otus_food_app/feature/recipe_list/domain/recipe_list_state/recipe_list_cubit.dart';
import 'package:otus_food_app/feature/recipe_list/ui/components/recipe_card.dart';
import 'package:otus_food_app/feature/navbar/ui/bottom_nav_bar.dart';
import 'package:otus_food_app/feature/recipe_list/ui/recipe_detail_screen.dart';
import 'package:otus_food_app/slider_page_route.dart';
import 'package:otus_food_app/feature/auth/domain/auth_state/auth_cubit.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    final userId = context.read<AuthCubit>().state.maybeWhen(
          authorized: (userEntity) => int.parse(userEntity.id),
          orElse: () => 0,
        );
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(screenIdx: 2),
      backgroundColor: const Color(0xFFC2C2C2),
      body: BlocBuilder<RecipeListCubit, RecipeListState>(
          builder: (context, state) {
        List<Recipe>? recipes = state.whenOrNull(
          loaded: (recipeList) => recipeList
              .where((r) => r.favoriteRecipes!.any((f) => f.user?.id == userId))
              .toList(),
        );
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemCount: recipes?.length ?? 0,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(SliderPageRoute(
                                widget: RecipeDetail(recipe: recipes![index])));
                          },
                          child: RecipeCard(
                              recipe: recipes![index], showFavorites: true),
                        );
                      }),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
