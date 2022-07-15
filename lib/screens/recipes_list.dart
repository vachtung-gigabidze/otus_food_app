import 'package:flutter/material.dart';
import 'package:otus_food_app/constants.dart';
import 'package:otus_food_app/model.dart';
import 'package:otus_food_app/widgets/List/recept_card.dart';

class ReceptsList extends StatelessWidget {
  const ReceptsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final recepts = ModalRoute.of(context)!.settings.arguments as RecipesModel;

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
        decoration: const BoxDecoration(
          color: AppColors.greyColor,
        ),
        child: ListView.builder(
          itemCount: recepts.recipes?.length ?? 1,
          itemBuilder: (context, index) {
            return ReceptCard(recept: recepts.recipes![index]);
          },
        ),
      ),
    );
  }
}
