import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:otus_food_app/feature/recipe_list/domain/recipe_list_repository.dart';
import 'package:otus_food_app/feature/recipe_list/domain/entities/recipe_entity.dart';

part 'recipe_list_state.dart';
part 'recipe_list_cubit.freezed.dart';
part 'recipe_list_cubit.g.dart';

class RecipeListCubit extends HydratedCubit<RecipeListState> {
  RecipeListCubit(this.recipeListRepository) : super(RecipeListState.empty());

  final RecipeListRepository recipeListRepository;

  Future<void> getRecipeList({bool refresh = false}) async {
    if (state is _RecipeListStateLoaded && !refresh) {
      return;
    }
    emit(RecipeListState.waiting());
    try {
      final List<Recipe>? recipeList =
          await recipeListRepository.getAllRecipe();
      emit(RecipeListState.loaded(recipeList!));
    } catch (error, st) {
      addError(error, st);
    }
  }

  @override
  RecipeListState? fromJson(Map<String, dynamic> json) {
    final state = RecipeListState.fromJson(json);
    return state.whenOrNull(
      loaded: (recipeList) => RecipeListState.loaded(recipeList),
    );
  }

  @override
  Map<String, dynamic>? toJson(RecipeListState state) {
    return state
            .whenOrNull(
              loaded: (recipeList) => RecipeListState.loaded(recipeList),
            )
            ?.toJson() ??
        RecipeListState.empty().toJson();
  }
}
