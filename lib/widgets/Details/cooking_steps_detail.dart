import 'package:flutter/material.dart';
import 'package:otus_food_app/model.dart';
import 'package:otus_food_app/widgets/Details/cooking_step.dart';

class CookingStepsDetail extends StatelessWidget {
  CookingStepsDetail({Key? key, required this.snapshot}) : super(key: key);

  final AsyncSnapshot<RecipesModel> snapshot;

  @override
  Widget build(BuildContext context) {
    var recept = snapshot.data?.recipes?[0];
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 19,
          ),
          const Text(
            'Шаги приготовления',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w600,
              fontSize: 16.0,
              color: Color(0xFF165932),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            //height: 600,
            child: ListView.builder(
                shrinkWrap: true,
                //padding: const EdgeInsets.all(8),
                itemCount: recept?.cookingSteps?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  return cookingStepCard(recept?.cookingSteps?[index]);
                }),
          )
        ],
      ),
    );
  }
}
