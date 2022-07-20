import 'package:flutter/material.dart';
import 'package:otus_food_app/model.dart';
import 'package:otus_food_app/widgets/Details/cooking_step.dart';

class CookingStepsDetail extends StatelessWidget {
  const CookingStepsDetail({Key? key, required this.snapshot})
      : super(key: key);

  final AsyncSnapshot<Recipe> snapshot;

  @override
  Widget build(BuildContext context) {
    var recept = snapshot.data;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Шаги приготовления',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            fontSize: 16.0,
            color: Color(0xFF165932),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            //padding: const EdgeInsets.all(8),

            itemCount: recept?.cookingSteps?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: cookingStepCard(recept?.cookingSteps?[index]),
              );
            })
      ],
    );
  }
}