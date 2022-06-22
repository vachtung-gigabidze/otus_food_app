import 'package:flutter/material.dart';
import 'package:otus_food_app/model.dart';

class IngredientsDetails extends StatelessWidget {
  IngredientsDetails({Key? key, required this.snapshot}) : super(key: key);

  final AsyncSnapshot<RecipesModel> snapshot;

  @override
  Widget build(BuildContext context) {
    var recept = snapshot.data?.recipes?[0];
    return Column(children: [
      const Text('Ингредиенты'),
      Container(
        height: 800,
        child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: recept?.ingredients?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: Center(
                    child: Row(
                  children: [
                    Text('${recept?.ingredients?[index].name}'),
                    Text('${recept?.ingredients?[index].quantity}'),
                  ],
                )),
              );
            }),
      )
    ]);
  }
}
