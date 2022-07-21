import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:otus_food_app/model.dart';
import 'package:flutter/services.dart' show rootBundle;

class RecipeApi {
  Future<RecipesModel> fetchRecipes(
      {String assetsPath = "assets/recipes.json"}) async {
    log('read recept: $assetsPath');

    return rootBundle
        .loadString(assetsPath)
        .then((json) => RecipesModel.fromJson(jsonDecode(json)));
  }

  Future<List<Recipe>?> fetchFavoritesRecipes(
      {String assetsPath = "assets/recipes.json"}) async {
    log('read recept: $assetsPath');

    return rootBundle.loadString(assetsPath).then((json) {
      var recipesModel = RecipesModel.fromJson(jsonDecode(json));

      return recipesModel.recipes?.take(3).toList();
    });
  }

  Future<List<Recipe>?> fetchAvailableRecipes(
      {String assetsPath = "assets/recipes.json"}) async {
    log('read recept: $assetsPath');

    return rootBundle.loadString(assetsPath).then((json) {
      var recipesModel = RecipesModel.fromJson(jsonDecode(json));

      return recipesModel.recipes?.take(3).toList();
    });
  }

  Future<FridgeModel> fetchFridge(
      {String assetsPath = "assets/fridge.json"}) async {
    log('read fridge: $assetsPath');

    return rootBundle
        .loadString(assetsPath)
        .then((json) => FridgeModel.fromJson(jsonDecode(json)));
  }

  String showTime(int cookingTime) {
    int minute = cookingTime ~/ 60;
    int second = cookingTime % 60;

    return '${minute < 10 ? '0$minute' : minute}:${second < 10 ? '0$second' : second}';
  }
}
