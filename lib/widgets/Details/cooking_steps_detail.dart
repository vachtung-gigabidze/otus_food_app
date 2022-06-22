import 'package:flutter/material.dart';
import 'package:otus_food_app/model.dart';

class CookingStepsDetail extends StatelessWidget {
  CookingStepsDetail({Key? key, required this.snapshot}) : super(key: key);

  final AsyncSnapshot<RecipesModel> snapshot;

  @override
  Widget build(BuildContext context) {
    var recept = snapshot.data?.recipes?[0];
    return Container(
      child: Column(children: [
        const Text('Шаги приготовления'),
        Container(
          height: 600,
          child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: recept?.cookingSteps?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Center(
                      child: Row(
                    children: [
                      Text('${recept?.cookingSteps?[index].order}'),
                      Text('${recept?.cookingSteps?[index].step}'),
                      Column(
                        children: [
                          //CheckBox
                          Text('${recept?.cookingSteps?[index].duration}'),
                        ],
                      ),
                    ],
                  )),
                );
              }),
        )
      ]),
    );
  }
}
