import 'dart:convert';
import 'dart:developer';

import 'package:otus_food_app/model.dart';
import 'package:flutter/services.dart' show rootBundle;

class ReceptApi {
  Future<RecipesModel> fetchRecipets(
      {String assetsPath = "assets/recept.json"}) async {
    log('read: $assetsPath');

    return rootBundle
        .loadString(assetsPath)
        .then((json) => RecipesModel.fromJson(jsonDecode(json)));
  }
}
