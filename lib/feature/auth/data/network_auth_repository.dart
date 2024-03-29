import 'package:dio/dio.dart';
// import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
// import 'package:otus_food_app/app/data/dio_container.dart';
import 'package:otus_food_app/app/domain/app_api.dart';
import 'package:otus_food_app/feature/auth/data/dto/user_dto.dart';
import 'package:otus_food_app/feature/auth/domain/auth_repository.dart';
import 'package:otus_food_app/feature/auth/domain/entities/user_entity/user_entity.dart';

@Injectable(as: AuthRepository)
// @prod
class NetworkAuthRepository implements AuthRepository {
  final AppApi api;

  NetworkAuthRepository(this.api);

  @override
  Future<UserEntity> getProfile() async {
    try {
      final response = await api.getProfile();
      return UserDto.fromJson(response.data["data"]).toEntity();
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<String> passwordUpdate(
      {required String? oldPassword, required String? newPassword}) async {
    try {
      final Response response = await api.passwordUpdate(
        oldPassword: oldPassword,
        newPassword: newPassword,
      );

      return response.data["message"];
    } on DioError catch (error) {
      return error.response?.data["message"];
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<UserEntity> refreshToken({String? refreshToken}) async {
    try {
      final response = await api.refreshToken();
      return UserDto.fromJson(response.data["data"]).toEntity();
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<UserEntity> singIn(
      {required String password, required String login}) async {
    try {
      final response = await api.singIn(password: password, login: login);
      return UserDto.fromJson(response.data["data"]).toEntity();
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future singUp({
    required String password,
    required String login,
    required String email,
  }) async {
    try {
      final response =
          await api.singUp(password: password, login: login, email: email);

      return UserDto.fromJson(response.data["data"]).toEntity();
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<UserEntity> userUpdate({String? login, String? email}) async {
    try {
      final response = await api.userUpdate(login: login, email: email);

      return UserDto.fromJson(response.data["data"]).toEntity();
    } catch (_) {
      rethrow;
    }
  }
}
