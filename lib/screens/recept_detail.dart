import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:otus_food_app/api/recept_api.dart';
import 'package:otus_food_app/constants.dart';
import 'package:otus_food_app/model.dart';
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
              'assets/icons/megafon.png',
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
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Рецепты',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Холодильник',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Избраное',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Профиль',
          ),
        ],
        //currentIndex: 1,
        selectedItemColor: Colors.amber[800],
        // onTap: () {},
      ),
      body: FutureBuilder<RecipesModel>(
        future: recepts,
        builder: (context, snapshot) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  HeaderDetail(snapshot: snapshot),
                  IngredientsDetails(snapshot: snapshot),
                  CookingStepsDetail(snapshot: snapshot),
                  CookingButton()
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
