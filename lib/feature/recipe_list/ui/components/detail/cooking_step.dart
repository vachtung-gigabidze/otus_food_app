import 'package:flutter/material.dart';
import 'package:otus_food_app/constants.dart';
import 'package:otus_food_app/feature/recipe_list/domain/entities/recipe_entity.dart';
import 'package:otus_food_app/feature/recipe_list/ui/components/detail/check_box.dart';
import 'package:otus_food_app/utils/recipe_utils.dart';

class CookingStepCard extends StatefulWidget {
  const CookingStepCard({super.key, this.cookingStepLink});

  final RecipeStepLink? cookingStepLink;
  @override
  State<CookingStepCard> createState() => CookingStepCardState();
}

class CookingStepCardState extends State<CookingStepCard> {
  late RecipeStepLink? cookingStepLink;
  late RecipeStep? cookingStep;
  @override
  void initState() {
    cookingStepLink = widget.cookingStepLink;
    cookingStep = cookingStepLink?.step;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      height: 120,
      alignment: Alignment.center,
      child: SizedBox(
        height: 120,
        child: Card(
          color: AppColors().stepBackground(
              cookingStepLink!.status ?? CookingStepsStatus.notStarted),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                margin: const EdgeInsets.all(24),
                child: Text(
                  '${cookingStepLink?.number}',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w900,
                    fontSize: 40.0,
                    color: AppColors().stepText(cookingStepLink?.status),
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  '${cookingStep?.name}',
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      fontSize: 12.0,
                      color: AppColors().stepText(cookingStepLink?.status)),
                  overflow: TextOverflow.clip,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(22),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        if (cookingStepLink?.status ==
                            CookingStepsStatus.notStarted) {
                          return;
                        }
                        setState(() {
                          if (cookingStepLink?.status ==
                              CookingStepsStatus.passed) {
                            cookingStepLink?.status =
                                CookingStepsStatus.notPassed;
                          } else {
                            cookingStepLink?.status = CookingStepsStatus.passed;
                          }
                        });
                      },
                      child: CheckBoxView(
                          cookingStepsStatus: cookingStepLink?.status),
                    ),
                    Text(
                      RecipeUtils.nameTime(cookingStep?.duration ?? 0),
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w700,
                        fontSize: 13.0,
                        color:
                            AppColors().stepCheckbox(cookingStepLink?.status),
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
}
