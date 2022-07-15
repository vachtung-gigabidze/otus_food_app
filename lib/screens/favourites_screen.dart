import 'package:flutter/material.dart';
import 'package:otus_food_app/api/recept_api.dart';

import 'package:otus_food_app/constants.dart';
import 'package:otus_food_app/model.dart';
import 'package:otus_food_app/widgets/List/recept_card.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({Key? key}) : super(key: key);

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  Future<FridgeModel> fridge = Future.value(ReceptApi().fetchFridge());

  Future<List<Recipe>?> recepts =
      Future.value(ReceptApi().fetchFavouritesRecipets());

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
              Constants.iconHeart,
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

        currentIndex: 2,
        showUnselectedLabels: true,
        selectedItemColor: AppColors.accent,
        unselectedItemColor: AppColors.greyColor,
        // onTap: () {},
      ),
      backgroundColor: const Color(0xFFC2C2C2),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FutureBuilder<List<Recipe>?>(
                    future: recepts,
                    builder: (context, snap) => ListView.builder(
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemCount: snap.data?.length ?? 1,
                        itemBuilder: (context, index) {
                          return snap.hasData
                              ? ReceptCard(recept: snap.data![index])
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
