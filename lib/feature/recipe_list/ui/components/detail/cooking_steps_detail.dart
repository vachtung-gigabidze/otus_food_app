import 'package:flutter/material.dart';
import 'package:otus_food_app/feature/recipe_list/domain/entities/recipe_entity.dart';
import 'package:otus_food_app/feature/recipe_list/ui/components/detail/cooking_step.dart';

class CookingStepsDetail extends StatelessWidget {
  const CookingStepsDetail({Key? key, required this.recipe}) : super(key: key);

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
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
            itemCount: recipe.recipeStepLinks?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: CookingStepCard(
                    cookingStepLink: recipe.recipeStepLinks?[index]),
              );
            })
      ],
    );
  }
}
