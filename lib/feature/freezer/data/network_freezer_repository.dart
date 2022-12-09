// import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:otus_food_app/app/domain/app_api.dart';
import 'package:otus_food_app/feature/freezer/domain/entities/freezer.dart';
// import 'package:otus_food_app/feature/freezer/domain/entities/freezer.dart';
import 'package:otus_food_app/feature/freezer/freezer_repository.dart';

@Injectable(as: FreezerRepository)
class NetworkFreezerRepository implements FreezerRepository {
  final AppApi api;

  NetworkFreezerRepository(this.api);

  @override
  Future<List<Freezer>?> fetchFreezer(int userId) async {
    List<Freezer>? freezers;
    try {
      // final freezer;
      final response = await api.fetchFreezer(userId);
      List responseJson = response.data;
      freezers = responseJson.map((f) => Freezer.fromJson(f)).toList();
      return freezers;
    } catch (_) {
      rethrow;
    }
  }
}
