import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otus_food_app/app/domain/error_entity/error_entity.dart';
import 'package:otus_food_app/feature/recipe_list/domain/recipe_list_state/recipe_list_cubit.dart';

class RecipeListBuilder extends StatelessWidget {
  const RecipeListBuilder({
    super.key,
    required this.isEmpty,
    required this.isWaiting,
    required this.isLoaded,
  });

  final WidgetBuilder isEmpty;
  final WidgetBuilder isWaiting;
  final ValueWidgetBuilder isLoaded;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RecipeListCubit, RecipeListState>(
        builder: (context, state) => state.when(
              empty: () => isEmpty(context),
              loaded: (recipeList) => isLoaded(context, recipeList, this),
              waiting: () => isWaiting(context),
              error: (error) => isLoaded(context, [], this), //isEmpty(context),
            ),
        listenWhen: ((previous, current) =>
            previous.mapOrNull(
              error: (value) => value,
            ) !=
            current.mapOrNull(
              error: (value) => value,
            )),
        listener: (context, state) {
          state.whenOrNull(
            error: (error) =>
                _showSnackBar(context, ErrorEntity.fromException(error)),
          );
        });
  }

  void _showSnackBar(BuildContext context, ErrorEntity error) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(seconds: 5),
        content: SingleChildScrollView(
          child: Text(maxLines: 5, error.show()),
        )));
  }
}
