import 'package:flutter/material.dart';
import 'package:otus_food_app/api/recipe_api.dart';

import 'package:otus_food_app/model.dart';
import 'package:otus_food_app/widgets/detail/ingredients_detail.dart';
import 'package:otus_food_app/widgets/lists/recipe_card.dart';
import 'package:otus_food_app/widgets/bottom_nav_bar.dart';

class FridgeScreen extends StatefulWidget {
  const FridgeScreen({Key? key}) : super(key: key);

  @override
  State<FridgeScreen> createState() => _FridgeScreenState();
}

class _FridgeScreenState extends State<FridgeScreen> {
  Future<FridgeModel> fridge = Future.value(RecipeApi().fetchFridge());

  Future<List<Recipe>?> recipes =
      Future.value(RecipeApi().fetchAvailableRecipes());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      backgroundColor: const Color(0xFFC2C2C2),
      body: SingleChildScrollView(
        child: FutureBuilder<FridgeModel>(
            future: fridge,
            builder: (context, snap) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 37,
                      ),
                      IngredientsDetails(
                          ingredients: snap.data?.fridge,
                          title: 'В холодильнике'),
                      const SizedBox(
                        height: 21,
                      ),
                      SizedBox(
                        height: 48,
                        width: 232,
                        child: TextButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0),
                              // side: BorderSide(color: Colors.red)
                            )),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                const Color(0xFF2ECC71)),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Рекомендовать рецепты',
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.0,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                      ),
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
              );
            }),
      ),
    );
  }
}
