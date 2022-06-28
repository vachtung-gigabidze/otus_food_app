import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:otus_food_app/model.dart';
import 'package:flutter/services.dart' show rootBundle;

class ReceptApi {
  Future<RecipesModel> fetchRecipets(
      {String assetsPath = "assets/recept.json"}) async {
    log('read recept: $assetsPath');

    return rootBundle
        .loadString(assetsPath)
        .then((json) => RecipesModel.fromJson(jsonDecode(json)));
  }

  Future<List<Recipe>?> fetchFavouritesRecipets(
      {String assetsPath = "assets/recept.json"}) async {
    log('read recept: $assetsPath');

    return rootBundle.loadString(assetsPath).then((json) {
      var recipesModel = RecipesModel.fromJson(jsonDecode(json));

      return recipesModel.recipes?.take(3).toList();
    });
  }

  Future<List<Recipe>?> fetchAvailableRecipets(
      {String assetsPath = "assets/recept.json"}) async {
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
}
