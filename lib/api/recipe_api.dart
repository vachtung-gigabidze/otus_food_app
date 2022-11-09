import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
// import 'package:otus_food_app/model.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_network_connectivity/flutter_network_connectivity.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:otus_food_app/feature/recipe_list/domain/entities/recipe_entity.dart';
import 'package:otus_food_app/models/recipe_model.dart';
// import 'package:otus_food_app/models/recipe_model.dart';
import 'package:path_provider/path_provider.dart';

class RecipeApi {
  //final url ='https://raw.githubusercontent.com/vachtung-gigabidze/otus_food_app/main/db.json';
  //// 'https://my-json-server.typicode.com/vachtung-gigabidze/otus_food_app/db');

  // final url = 'http://172.20.20.4:8888/recipe';
  final recipeUrl = 'https://dart.nvavia.ru/recipe';
  final userUrl = 'http://172.20.20.4:8888/user';
  // final commentUrl = 'http://172.20.20.4:8888/comment';

  late Box box;
  bool? isInternetAvailableOnCall;
  bool? isInternetAvailableStreamStatus;

  Future openBox() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    box = await Hive.openBox('recipes');
    return;
  }

  // initBox() async {
  //   await Hive.initFlutter();

  //   flutterNetworkConnectivity.getInternetAvailabilityStream().listen((event) {
  //     isInternetAvailableStreamStatus = event;
  //   });
  // }

  // getAllData() async {
  //   await openBox();

  //   fetchDB();
  // }

  // final FlutterNetworkConnectivity flutterNetworkConnectivity =
  //     FlutterNetworkConnectivity(
  //   isContinousLookUp:
  //       true, // optional, false if you cont want continous lookup
  //   lookUpDuration: const Duration(
  //       seconds: 5), // optional, to override default lookup duration
  //   lookUpUrl: 'example.com', // optional, to override default lookup url
  // );

  // putData(RecipeModel data) async {
  //   await box.clear();
  //   box.add(data);
  // }

  // fetchDB() async {
  //   RecipeModel? recipes;

  //   try {
  //     var response = await Dio().get("http://172.20.20.4:8888/recipe");

  //     //recipes = RecipeModel.fromJson(jsonDecode(response.data));
  //     await putData(response.data);
  //   } catch (e) {
  //     log('error: $e');
  //   }

  //   return recipes;
  // }

  Future<List<Recipe>?> fetchRecipes() async {
    FlutterNetworkConnectivity flutterNetworkConnectivity =
        FlutterNetworkConnectivity(
      isContinousLookUp:
          true, // optional, false if you cont want continous lookup
      lookUpDuration: const Duration(
          seconds: 5), // optional, to override default lookup duration
      lookUpUrl: 'example.com', // optional, to override default lookup url
    );

    List<Recipe>? recipes;

    try {
      var response = await Dio().get(recipeUrl);
      List responseJson = response.data;
      recipes = responseJson.map((v) => Recipe.fromJson(v)).toList();
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
    // log('read recept: $assetsPath');

    // return rootBundle.loadString(assetsPath).then((json) {
    //   var recipe = Recipe.fromJson(jsonDecode(json));

    //   return recipe.take(3).toList();
    // });
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

  //Future<User> fetchUser({String assetsPath = "assets/model/user.json"}) async {
  // Future<User> fetchUser() async {
  //   User? user;

  //   try {
  //     var response = await Dio().get(userUrl);
  //     List responseJson = response.data;
  //     user = User.fromJson(responseJson.first);
  //   } catch (e) {
  //     log('error: $e');
  //   }
  //   return user!;
  //   // return rootBundle.loadString(assetsPath).then((json) {
  //   //   List<User> users = [];

  //   //   jsonDecode(json).forEach((v) {
  //   //     users.add(User.fromJson(v));
  //   //   });

  //   //   return users.first;
  //   // });
  // }
}
