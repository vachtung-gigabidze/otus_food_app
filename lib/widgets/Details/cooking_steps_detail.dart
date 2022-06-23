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
          //height: 600,
          child: ListView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.all(8),
              itemCount: recept?.cookingSteps?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 120,
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: double.infinity,
                    child: Card(
                      child: ListTile(
                        leading: SizedBox(
                          height: 55,
                          width: 55,
                          child: Text(
                            '${recept?.cookingSteps?[index].order}',
                            style: TextStyle(fontSize: 50),
                          ),
                        ),
                        title: Text('${recept?.cookingSteps?[index].step}'),
                        //subtitle: Text('Here is a second line'),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.check_box),
                            Text('${recept?.cookingSteps?[index].duration}')
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
        )
      ]),
    );
  }
}
