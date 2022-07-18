import 'package:flutter/material.dart';
import 'package:otus_food_app/constants.dart';
import 'package:otus_food_app/model.dart';
import 'package:otus_food_app/widgets/List/recipe_card.dart';

class RecipesList extends StatelessWidget {
  const RecipesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final recipes =
        (ModalRoute.of(context)!.settings.arguments as RecipesModel).recipes;

    return Scaffold(
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
        padding: const EdgeInsets.only(top: 33),
        decoration: const BoxDecoration(
          color: AppColors.greyColor,
        ),
        child: ListView.builder(
          itemCount: recipes?.length ?? 1,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 12.0, bottom: 12),
              child: RecipeCard(recipe: recipes![index]),
            );
          },
        ),
      ),
    );
  }
}
