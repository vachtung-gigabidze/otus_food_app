import 'package:flutter/material.dart';
import 'package:otus_food_app/constants.dart';
// import 'package:path/path.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late int currentIndex;

  @override
  void initState() {
    currentIndex = 0;
    super.initState();
  }

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
        //     Constants.iconHeartBlack,
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
          label: 'Вход',
        ),
      ],
      currentIndex: currentIndex,
      showUnselectedLabels: true,
      selectedItemColor: AppColors.accent,
      unselectedItemColor: AppColors.greyColor,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
        if (index == 0) {
          Navigator.of(context).pushNamed('/root');
        } else if (index == 1) {
          Navigator.of(context).pushNamed('/login');
        } else if (index == 2) {
        } else if (index == 3) {}
      },
    );
  }
}
