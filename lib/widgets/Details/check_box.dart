import 'package:flutter/material.dart';
import 'package:otus_food_app/constants.dart';
import 'package:otus_food_app/model.dart';

Widget checkBoxView(CookingStepsStatus cookingStepsStatus) {
  return Image(
    image: AssetImage(Constants().checkBox_icon(cookingStepsStatus)),
    height: 30,
    width: 30,
    fit: BoxFit.cover,
  );
}
