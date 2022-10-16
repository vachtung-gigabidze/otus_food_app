import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
// import 'package:otus_food_app/model.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:otus_food_app/models/recipe_model.dart';

class RecipeApi {
  Future<RecipeModel?> fetchRecipes() async {
    RecipeModel? recipes;

    try {
      var response = await Dio().get(
          'https://my-json-server.typicode.com/vachtung-gigabidze/otus_food_app/db');

      recipes = RecipeModel.fromJson(response.data);
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
      var recipesModel = RecipeModel.fromJson(jsonDecode(json));

      return recipesModel.recipes?.take(3).toList();
    });
  }

  Future<List<Recipe>?> fetchAvailableRecipes(
      {String assetsPath = "assets/model/recipes.json"}) async {
    log('read recept: $assetsPath');

    return rootBundle.loadString(assetsPath).then((json) {
      var recipesModel = RecipeModel.fromJson(jsonDecode(json));

      return recipesModel.recipes?.take(3).toList();
    });
  }

  Future<Freezer> fetchFridge(
      {String assetsPath = "assets/fridge.json"}) async {
    log('read fridge: $assetsPath');

    return rootBundle
        .loadString(assetsPath)
        .then((json) => Freezer.fromJson(jsonDecode(json)));
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
