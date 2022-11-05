import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:otus_food_app/constants.dart';
import 'package:otus_food_app/feature/recipe_list/domain/entities/recipe_entity.dart';
import 'package:otus_food_app/feature/recipe_list/ui/components/recipe_card.dart';
// import 'package:otus_food_app/slider_page_route.dart';
// import 'package:otus_food_app/widgets/lists/recipe_card.dart';
// import 'package:otus_food_app/widgets/bottom_nav_bar.dart';
import 'package:otus_food_app/widgets/status_style.dart';

class RecipesListScreen extends StatelessWidget {
  const RecipesListScreen({Key? key, this.recipes}) : super(key: key);

  final List<Recipe>? recipes;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: StatusOverlay.grey,
      child: Scaffold(
        //bottomNavigationBar: const BottomNavBar(),
        body: Container(
          padding: const EdgeInsets.only(top: 45, left: 16, right: 16),
          decoration: const BoxDecoration(
            color: AppColors.greyColor,
          ),
          child: ListView.builder(
            physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
            itemCount: recipes!.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(
                  bottom: 16,
                ),
                child: InkWell(
                  onTap: () {
                    //Navigator.pushNamed(context, '/detail',
                    //   arguments: recipes.data?.recipes?[index]);
                    // Navigator.of(context).push(SliderPageRoute(
                    //     widget: RecipeDetail(
                    //         recipe: recipes.data?[index])));
                  },
                  child: RecipeCard(
                    recipe: recipes![index],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
