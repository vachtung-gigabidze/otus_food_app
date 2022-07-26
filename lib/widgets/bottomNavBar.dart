import 'package:flutter/material.dart';
import 'package:otus_food_app/constants.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
        //   label: 'Избранное',
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
    );
  }
}
