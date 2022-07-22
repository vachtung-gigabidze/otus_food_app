import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:otus_food_app/api/recipe_api.dart';
import 'package:otus_food_app/constants.dart';
import 'package:otus_food_app/model.dart';
import 'package:otus_food_app/widgets/List/recipe_card.dart';
import 'package:otus_food_app/widgets/status_style.dart';

class RecipesList extends StatelessWidget {
  const RecipesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //SystemChrome.setSystemUIOverlayStyle(StatusOverlay.grey);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: StatusOverlay.grey,
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: ImageIcon(Image.asset(
                Constants.iconPizza,
                height: 24,
                width: 24,
              ).image),
              label: 'Рецепты',
              backgroundColor: Colors.white,
            ),
            // BottomNavigationBarItem(
            //   icon: ImageIcon(Image.asset(
            //     Constants.iconFridge,
            //     height: 24,
            //     width: 24,
            //   ).image),
            //   label: 'Холодильник',
            // ),
            // BottomNavigationBarItem(
            //   icon: ImageIcon(Image.asset(
            //     Constants.iconHeart,
            //     height: 24,
            //     width: 24,
            //   ).image),
            //   label: 'Избраное',
            // ),
            BottomNavigationBarItem(
              icon: ImageIcon(Image.asset(
                Constants.iconProfile,
                height: 24,
                width: 24,
              ).image),
              label: 'Профиль',
            ),
          ],

          currentIndex: 0,
          showUnselectedLabels: true,
          selectedItemColor: AppColors.accent,
          unselectedItemColor: AppColors.greyColor,
          // onTap: () {},
        ),
        body: Container(
          padding: const EdgeInsets.only(top: 45, left: 16, right: 16),
          decoration: const BoxDecoration(
            color: AppColors.greyColor,
          ),
          child: FutureBuilder<RecipesModel>(
            future: RecipeApi().fetchRecipes(),
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
                      child: RecipeCard(recipe: recipes.data?.recipes?[index]),
                    );
                  },
                );
              } else {
                return Container(
                  child: Text('No data'),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
