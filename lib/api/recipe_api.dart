import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:otus_food_app/feature/recipe_list/domain/entities/recipe_entity.dart';
import 'package:otus_food_app/models/recipe_model.dart';

class RecipeApi {
  // final url = 'http://172.20.20.4:8888/recipe';
  final recipeUrl = 'https://dart.nvavia.ru/recipe';
  final userUrl = 'http://172.20.20.4:8888/user';
  // final commentUrl = 'http://172.20.20.4:8888/comment';

  Future<List<Recipe>?> fetchRecipes() async {
    List<Recipe>? recipes;

    try {
      var response = await Dio().get(recipeUrl);
      List responseJson = response.data;
      recipes = responseJson.map((v) => Recipe.fromJson(v)).toList();
    } catch (e) {
      log('error: $e');
    }

    return recipes;
  }

  Future<List<Recipe>?> fetchFavoritesRecipes(
      {String assetsPath = "assets/model/recipes.json"}) async {
    return null;
  }

  Future<List<Recipe>?> fetchAvailableRecipes(
      {String assetsPath = "assets/model/recipes.json"}) async {
    log('read recept: $assetsPath');

    // return rootBundle.loadString(assetsPath).then((json) {
    //   var recipesModel = RecipeModel.fromJson(jsonDecode(json));

    //   return recipesModel.recipes?.take(3).toList();
    // });
    return null;
  }

  Future<Freezer> fetchFridge(
      {String assetsPath = "assets/fridge.json"}) async {
    log('read fridge: $assetsPath');

    return rootBundle
        .loadString(assetsPath)
        .then((json) => Freezer.fromJson(jsonDecode(json)));
  }
}
