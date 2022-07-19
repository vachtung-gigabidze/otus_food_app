import 'package:flutter/material.dart';
import 'package:otus_food_app/constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          BottomNavigationBarItem(
            icon: ImageIcon(Image.asset(
              Constants.iconFridge,
              height: 24,
              width: 24,
            ).image),
            label: 'Холодильник',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(Image.asset(
              Constants.iconHeartGreen,
              height: 24,
              width: 24,
            ).image),
            label: 'Избраное',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(Image.asset(
              Constants.iconProfile,
              height: 24,
              width: 24,
            ).image),
            label: 'Профиль',
          ),
        ],

        currentIndex: 3,
        showUnselectedLabels: true,
        selectedItemColor: AppColors.accent,
        unselectedItemColor: AppColors.greyColor,
        // onTap: () {},
      ),
      backgroundColor: const Color(0xFFC2C2C2),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 123,
              width: 123,
              padding: const EdgeInsets.all(13),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xFF165932),
                  width: 4,
                ),
              ),
              child: Image.asset(
                Constants.imageProfile,
                height: 96,
                width: 96,
                fit: BoxFit.fitWidth,
              ),
            ),
            const SizedBox(
              height: 29,
            ),
            Container(
              width: 396.0,
              height: 64.0,
              decoration: const BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Логин',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        fontSize: 16.0,
                        color: Color(0xFF165932),
                      ),
                    ),
                    Text(
                      'avpetrov',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        fontSize: 16.0,
                        color: Color(0xFF165932),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              width: 396.0,
              height: 64.0,
              decoration: const BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              child: const Center(
                child: Text(
                  'Выход',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                    color: Color(0xFFF54848),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
