import 'package:flutter/material.dart';
import 'package:otus_food_app/constants.dart';
import 'package:otus_food_app/widgets/recept_card.dart';

class ReceptsList extends StatelessWidget {
  const ReceptsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.greyColor,
      ),
      child: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return ReceptCard();
        },
      ),
    );
  }
}
