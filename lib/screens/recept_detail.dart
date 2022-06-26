import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:otus_food_app/api/recept_api.dart';
import 'package:otus_food_app/constants.dart';
import 'package:otus_food_app/model.dart';
import 'package:otus_food_app/widgets/Details/comment_view.dart';
import 'package:otus_food_app/widgets/Details/cooking_button.dart';
import 'package:otus_food_app/widgets/Details/cooking_steps_detail.dart';
import 'package:otus_food_app/widgets/Details/ingredients_detail.dart';
import 'package:otus_food_app/widgets/Details/header_detail.dart';

class ReceptDetail extends StatelessWidget {
  ReceptDetail({Key? key, Recipes? this.recept}) : super(key: key);

  Future<RecipesModel> recepts = Future.value(ReceptApi().fetchRecipets());
  Recipes? recept;

  @override
  Widget build(BuildContext context) {
    //SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Рецепты',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              Constants.icon_megafon,
              height: 24,
              width: 24,
            ),
          )
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Show Snackbar',
          color: Colors.black87,
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('This is a snackbar')));
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(Image.asset(
              Constants.icon_pizza,
              height: 24,
              width: 24,
            ).image),
            label: 'Рецепты',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(Image.asset(
              Constants.icon_fridge,
              height: 24,
              width: 24,
            ).image),
            label: 'Холодильник',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(Image.asset(
              Constants.icon_heart,
              height: 24,
              width: 24,
            ).image),
            label: 'Избраное',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(Image.asset(
              Constants.icon_profile,
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
      body: FutureBuilder<RecipesModel>(
        future: recepts,
        builder: (context, snapshot) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      HeaderDetail(snapshot: snapshot),
                      IngredientsDetails(snapshot: snapshot),
                      CookingStepsDetail(snapshot: snapshot),
                    ],
                  ),
                ),
                const Divider(
                  height: 20,
                  thickness: 1,
                  indent: 0,
                  endIndent: 0,
                  color: Colors.black,
                ),
                CommentView(),
                CookingButton(),
              ],
            ),
          );
        },
      ),
    );
  }
}
