import 'package:flutter/material.dart';
import 'package:otus_food_app/constants.dart';
import 'package:otus_food_app/feature/recipe_list/domain/entities/recipe_entity.dart';
import 'package:otus_food_app/feature/recipe_list/domain/recipe_list_state/recipe_list_cubit.dart';
import 'package:otus_food_app/feature/recipe_list/ui/components/recipe_card.dart';
import 'package:otus_food_app/feature/recipe_list/ui/recipe_detail_screen.dart';
import 'package:otus_food_app/slider_page_route.dart';
import 'package:provider/provider.dart';

class RecipesListScreen extends StatelessWidget {
  const RecipesListScreen(
      {Key? key, this.recipes, required this.isInternetConnectivity})
      : super(key: key);

  final bool isInternetConnectivity;
  final List<Recipe>? recipes;

  @override
  Widget build(BuildContext context) {
    return
        //TODO: Перенести для страницы логин  в scaffold
        // AnnotatedRegion<SystemUiOverlayStyle>(
        //   value: StatusOverlay.grey,
        Container(
      padding: const EdgeInsets.only(top: 45, left: 16, right: 16),
      decoration: const BoxDecoration(
        color: AppColors.greyColor,
      ),
      child: RefreshIndicator(
        onRefresh: () {
          if (isInternetConnectivity) {
            context.read<RecipeListCubit>().getRecipeList(refresh: true);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Не соединения c интернетов')));
          }
          return Future(() => null);
        },
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
                  Navigator.of(context).push(SliderPageRoute(
                      widget: RecipeDetail(recipe: recipes![index])));
                },
                child: RecipeCard(
                  recipe: recipes![index],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
