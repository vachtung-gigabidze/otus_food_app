import 'package:flutter/material.dart';
import 'package:otus_food_app/constants.dart';
import 'package:otus_food_app/model.dart';
import 'package:otus_food_app/widgets/Details/check_box.dart';

Widget cookingStepCard(CookingStep? cookingStep) {
  return Container(
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.25),
          spreadRadius: 0,
          blurRadius: 4,
          offset: const Offset(0, 4), // changes position of shadow
        ),
      ],
    ),
    height: 120,
    alignment: Alignment.center,
    child: SizedBox(
      height: 120, //double.infinity,

      child: Card(
        color: AppColors().stepBackground(cookingStep!.status!),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              margin: const EdgeInsets.all(24),
              child: Text(
                '${cookingStep.order}',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w900,
                  fontSize: 40.0,
                  color: AppColors().stepText(cookingStep.status!),
                ),
              ),
            ),
            Expanded(
              child: Text(
                '${cookingStep.step}',
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.0,
                    color: AppColors().stepText(cookingStep.status!)),
                overflow: TextOverflow.clip,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(22),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  checkBoxView(cookingStep.status!),
                  Text(
                    '${cookingStep.duration}',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w700,
                      fontSize: 13.0,
                      color: AppColors().stepCheckbox(cookingStep.status!),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
