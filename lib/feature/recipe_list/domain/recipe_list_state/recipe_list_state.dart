// import 'package:otus_food_app/feature/recipe_list/domain/entities/recipe_entity.dart';

part of 'recipe_list_cubit.dart';

@freezed
class RecipeListState with _$RecipeListState {
  factory RecipeListState.empty() = _RecipeListStateEmpty;
  factory RecipeListState.loaded(List<Recipe> recipeList) =
      _RecipeListStateLoaded;
  factory RecipeListState.waiting() = _RecipeListStateWaiting;
  factory RecipeListState.error(dynamic error) = _RecipeListStateError;

  factory RecipeListState.fromJson(Map<String, dynamic> json) =>
      _$RecipeListStateFromJson(json);
}
