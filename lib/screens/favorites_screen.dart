import 'package:flutter/material.dart';
import 'package:otus_food_app/api/recipe_api.dart';

// import 'package:otus_food_app/constants.dart';
import 'package:otus_food_app/model.dart';
import 'package:otus_food_app/widgets/List/recipe_card.dart';
import 'package:otus_food_app/widgets/bottomNavBar.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  Future<FridgeModel> fridge = Future.value(RecipeApi().fetchFridge());

  Future<List<Recipe>?> recipes =
      Future.value(RecipeApi().fetchFavoritesRecipes());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      backgroundColor: const Color(0xFFC2C2C2),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FutureBuilder<List<Recipe>?>(
                    future: recipes,
                    builder: (context, snap) => ListView.builder(
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemCount: snap.data?.length ?? 1,
                        itemBuilder: (context, index) {
                          return snap.hasData
                              ? RecipeCard(recipe: snap.data![index])
                              : Container();
                        })),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
