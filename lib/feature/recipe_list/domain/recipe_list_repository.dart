import 'package:otus_food_app/feature/recipe_list/domain/entities/recipe_entity.dart';

abstract class RecipeListRepository {
  Future<List<Recipe>?> getAllRecipe();

  Future addFavorite(User user, Recipe recipe);

  Future deleteFavorite(int favoriteId);
}
