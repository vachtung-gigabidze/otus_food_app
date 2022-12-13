import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otus_food_app/feature/recipe_list/domain/entities/recipe_entity.dart';
import 'package:otus_food_app/feature/recipe_list/domain/recipe_list_state/recipe_list_cubit.dart';
import 'package:otus_food_app/feature/recipe_list/ui/components/recipe_card.dart';
import 'package:otus_food_app/feature/navbar/ui/bottom_nav_bar.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  // Future<Freezer> fridge = Future.value(RecipeApi().fetchFridge());

  //late List<Recipe>? recipes;
  //     Future.value(RecipeApi().fetchFavoritesRecipes());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(screenIdx: 2),
      backgroundColor: const Color(0xFFC2C2C2),
      body: BlocBuilder<RecipeListCubit, RecipeListState>(
          // listener: (context, state) {
          //   recipes = state.whenOrNull(
          //     loaded: (recipeList) => recipeList
          //         .where((r) => r.favoriteRecipes!.any((f) => f.user?.id == 3))
          //         .toList(),
          //   );
          // },
          builder: (context, state) {
        List<Recipe>? recipes = state.whenOrNull(
          loaded: (recipeList) => recipeList
              .where((r) => r.favoriteRecipes!.any((f) => f.user?.id == 3))
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
                        return RecipeCard(
                            recipe: recipes![index], showFavorites: true);
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
