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
    int hour = cookingTime ~/ 3600;
    int minute = (cookingTime - (hour * 3600)) ~/ 60;
    int second = (cookingTime - (hour * 3600)) % 60;

    String hourStr = hour != 0
        ? hour < 10
            ? '0$hour:'
            : '$hour:'
        : '';
    String minuteStr = minute < 10 ? '0$minute:' : '$minute:';

    String secondStr = second < 10 ? '0$second' : '$second';

    return hourStr + minuteStr + secondStr;
  }

  String nameTime(int cookingTime) {
    int hour = cookingTime ~/ 3600;
    int minute = (cookingTime - (hour * 3600)) ~/ 60;

    String hourStr = (hour == 1)
        ? '$hour час '
        : (hour >= 2 && hour <= 4)
            ? '$hour часа '
            : (hour == 0)
                ? ''
                : '$hour часов ';
    String minuteStr = (minute == 1)
        ? '$minute минута'
        : (minute >= 2 && minute <= 4)
            ? '$minute минуты'
            : (minute == 0)
                ? ''
                : '$minute минут';

    return '$hourStr$minuteStr';
  }
}
