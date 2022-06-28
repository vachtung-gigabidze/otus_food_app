import 'package:flutter/material.dart';
import 'package:otus_food_app/api/recept_api.dart';

import 'package:otus_food_app/constants.dart';
import 'package:otus_food_app/model.dart';
import 'package:otus_food_app/widgets/Details/ingredients_detail.dart';
import 'package:otus_food_app/widgets/List/recept_card.dart';

class FridgeScreen extends StatefulWidget {
  const FridgeScreen({Key? key}) : super(key: key);

  @override
  State<FridgeScreen> createState() => _FridgeScreenState();
}

class _FridgeScreenState extends State<FridgeScreen> {
  Future<FridgeModel> fridge = Future.value(ReceptApi().fetchFridge());

  Future<List<Recipe>?> recepts =
      Future.value(ReceptApi().fetchAvailableRecipets());

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

        currentIndex: 1,
        showUnselectedLabels: true,
        selectedItemColor: AppColors.accent,
        unselectedItemColor: AppColors.greyColor,
        // onTap: () {},
      ),
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
                          snapshot: snap.data?.fridge, title: 'В холодильнике'),
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
                          future: recepts,
                          builder: (context, snap) => ListView.builder(
                              shrinkWrap: true,
                              physics: ScrollPhysics(),
                              itemCount: snap.data?.length ?? 1,
                              itemBuilder: (context, index) {
                                return snap.hasData
                                    ? ReceptCard(recept: snap.data![index])
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
