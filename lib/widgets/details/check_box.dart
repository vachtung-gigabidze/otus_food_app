import 'package:flutter/material.dart';
import 'package:otus_food_app/constants.dart';
import 'package:otus_food_app/model.dart';

class CheckBoxView extends StatelessWidget {
  const CheckBoxView({Key? key, this.cookingStepsStatus}) : super(key: key);
  final CookingStepsStatus? cookingStepsStatus;
  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage(Constants().checkBoxIcon(cookingStepsStatus!)),
      height: 30,
      width: 30,
      fit: BoxFit.cover,
    );
  }
}
