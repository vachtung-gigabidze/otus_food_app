import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:otus_food_app/api/recipe_api.dart';
import 'package:otus_food_app/constants.dart';
import 'package:otus_food_app/model.dart';
import 'package:otus_food_app/widgets/List/recipe_card.dart';
import 'package:otus_food_app/widgets/bottom_nav_bar.dart';
import 'package:otus_food_app/widgets/status_style.dart';

class RecipesList extends StatefulWidget {
  const RecipesList({Key? key}) : super(key: key);

  @override
  State<RecipesList> createState() => _RecipesListState();
}

class _RecipesListState extends State<RecipesList> {
  Future<RecipesModel>? recipes;

  @override
  void initState() {
    recipes ??= RecipeApi().fetchRecipes();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //SystemChrome.setSystemUIOverlayStyle(StatusOverlay.grey);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: StatusOverlay.grey,
      child: Scaffold(
        bottomNavigationBar: const BottomNavBar(),
        body: Container(
          padding: const EdgeInsets.only(top: 45, left: 16, right: 16),
          decoration: const BoxDecoration(
            color: AppColors.greyColor,
          ),
          child: FutureBuilder<RecipesModel>(
            future: recipes,
            builder:
                (BuildContext context, AsyncSnapshot<RecipesModel> recipes) {
              if (recipes.hasData) {
                return ListView.builder(
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  itemCount: recipes.data?.recipes?.length ?? 1,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(
                        bottom: 16,
                      ),
                      child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/detail',
                                arguments: recipes.data?.recipes?[index]);
                          },
                          child: RecipeCard(
                              recipe: recipes.data?.recipes?[index])),
                    );
                  },
                );
              } else {
                return const Text('No data');
              }
            },
          ),
        ),
      ),
    );
  }
}
