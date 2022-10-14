import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:otus_food_app/model.dart';
import 'package:flutter/services.dart' show rootBundle;

class RecipeApi {
  Future<RecipesModel?> fetchRecipes() async {
    RecipesModel? recipes;

    try {
      var response = await Dio().get(
          'https://my-json-server.typicode.com/vachtung-gigabidze/otus_food_app/db');

      recipes = RecipesModel.fromJson(response.data);
    } catch (e) {
      log('error: $e');
    }

    return recipes;
    //   {String assetsPath = "assets/model/recipes.json"}) async {
    // log('read recept: $assetsPath');

    // //final client.Recipe r = client.Recipe();

    // return rootBundle
    //     .loadString(assetsPath)
    //     .then((json) => RecipesModel.fromJson(jsonDecode(json)));
  }

  Future<List<Recipe>?> fetchFavoritesRecipes(
      {String assetsPath = "assets/model/recipes.json"}) async {
    log('read recept: $assetsPath');

    return rootBundle.loadString(assetsPath).then((json) {
      var recipesModel = RecipesModel.fromJson(jsonDecode(json));

      return recipesModel.recipes?.take(3).toList();
    });
  }

  Future<List<Recipe>?> fetchAvailableRecipes(
      {String assetsPath = "assets/model/recipes.json"}) async {
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

  Future<User> fetchUser({String assetsPath = "assets/model/user.json"}) async {
    log('read recept: $assetsPath');

    return rootBundle.loadString(assetsPath).then((json) {
      List<User> users = [];

      jsonDecode(json).forEach((v) {
        users.add(User.fromJson(v));
      });

      return users.first;
    });
  }
}
