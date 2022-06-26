import 'package:flutter/material.dart';
import 'package:otus_food_app/constants.dart';
import 'package:otus_food_app/model.dart';
import 'package:otus_food_app/widgets/List/recept_card.dart';

class ReceptsList extends StatelessWidget {
  const ReceptsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final recepts = ModalRoute.of(context)!.settings.arguments as RecipesModel;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.greyColor,
      ),
      child: ListView.builder(
        itemCount: recepts.recipes?.length ?? 1,
        itemBuilder: (context, index) {
          return ReceptCard(recept: recepts.recipes![index]);
        },
      ),
    );
  }
}
