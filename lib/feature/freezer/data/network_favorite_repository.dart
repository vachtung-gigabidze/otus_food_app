// import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:otus_food_app/app/domain/app_api.dart';
// import 'package:otus_food_app/feature/freezer/domain/entities/freezer.dart';
import 'package:otus_food_app/feature/freezer/freezer_repository.dart';

@Injectable(as: FreezerRepository)
class NetworkFreezerRepository implements FreezerRepository {
  final AppApi api;

  NetworkFreezerRepository(this.api);

  @override
  Future<Iterable> fetchFreezer(int userId) async {
    try {
      // final freezer;
      final response = await api.fetchFreezer(userId);
      // freezer = response.data.map((f) => Freezer.fromJson(f));
      return response;
    } catch (_) {
      rethrow;
    }
  }
}
