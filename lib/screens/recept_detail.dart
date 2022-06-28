import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:otus_food_app/api/recept_api.dart';
import 'package:otus_food_app/constants.dart';
import 'package:otus_food_app/model.dart';
import 'package:otus_food_app/widgets/Details/comment_post.dart';
import 'package:otus_food_app/widgets/Details/comment_view.dart';
import 'package:otus_food_app/widgets/Details/cooking_button.dart';
import 'package:otus_food_app/widgets/Details/cooking_steps_detail.dart';
import 'package:otus_food_app/widgets/Details/ingredients_detail.dart';
import 'package:otus_food_app/widgets/Details/header_detail.dart';

class ReceptDetail extends StatelessWidget {
  ReceptDetail({Key? key, Recipe? this.recept}) : super(key: key);

  Future<RecipesModel> recepts = Future.value(ReceptApi().fetchRecipets());
  final Recipe? recept;

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
              Constants.iconMegafon,
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
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                    children: [
                      HeaderDetail(snapshot: snapshot),
                      IngredientsDetails(
                          snapshot: snapshot.data?.recipes?[0].ingredients),
                      const SizedBox(
                        height: 27,
                      ),
                      checkIngredients(),
                      const SizedBox(
                        height: 27,
                      ),
                      CookingStepsDetail(snapshot: snapshot),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 27,
                ),
                cookingButton(),
                const SizedBox(
                  height: 32,
                ),
                const Divider(
                  height: 20,
                  thickness: 1,
                  indent: 0,
                  endIndent: 0,
                  color: Colors.black,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      commentView(),
                      const SizedBox(
                        height: 35,
                      ),
                      const CommentPost(),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
