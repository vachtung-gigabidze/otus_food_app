import 'package:injectable/injectable.dart';
import 'package:otus_food_app/app/data/dio_container.dart';
import 'package:otus_food_app/feature/recipe_list/domain/entities/recipe_entity.dart';
import 'package:otus_food_app/feature/recipe_list/domain/recipe_list_repository.dart';

@Injectable(as: RecipeListRepository)
@prod
class NetworkRecipeListRepository implements RecipeListRepository {
  final DioContainer dioContainer;

  NetworkRecipeListRepository(this.dioContainer);

  @override
  Future<List<Recipe>?> getAllRecipe() async {
    List<Recipe>? recipes;
    try {
      final response = await dioContainer.dio.get("/recipe");
      List responseJson = response.data;
      recipes = responseJson.map((v) => Recipe.fromJson(v)).toList();
      return recipes;
    } catch (_) {
      rethrow;
    }
  }
}
