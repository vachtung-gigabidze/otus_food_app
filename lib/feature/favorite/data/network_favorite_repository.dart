import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:otus_food_app/app/domain/app_api.dart';
import 'package:otus_food_app/feature/favorite/favorite_repository.dart';
import 'package:otus_food_app/feature/recipe_list/domain/entities/recipe_entity.dart';

@Injectable(as: FavoriteRepository)
class NetworkFavoriteRepository implements FavoriteRepository {
  final AppApi api;

  NetworkFavoriteRepository(this.api);

  @override
  Future<List<Recipe>?> fetchFavorite(int userId) async {
    try {
      final Response response = await api.fetchFavorite(userId);

      return response.data.map((r) => Recipe.fromJson(r)).toList();
    } catch (_) {
      rethrow;
    }
  }
}
