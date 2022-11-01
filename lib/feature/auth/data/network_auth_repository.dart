import 'package:injectable/injectable.dart';
import 'package:otus_food_app/app/data/dio_container.dart';
import 'package:otus_food_app/feature/auth/data/dto/user_dto.dart';
import 'package:otus_food_app/feature/auth/domain/auth_repository.dart';
import 'package:otus_food_app/feature/auth/domain/entities/user_entity/user_entity.dart';

@Injectable(as: AuthRepository)
@prod
class NetworkAuthRepository implements AuthRepository {
  final DioContainer dioContainer;

  NetworkAuthRepository(this.dioContainer);

  @override
  Future getProfile() {
    // TODO: implement getProfile
    throw UnimplementedError();
  }

  @override
  Future passwordUpdate(
      {required String? oldPassword, required String? newPassword}) {
    // TODO: implement passwordUpdate
    throw UnimplementedError();
  }

  @override
  Future refreshToken({required String? refreshToken}) {
    // TODO: implement refreshToken
    throw UnimplementedError();
  }

  @override
  Future<UserEntity> singIn(
      {required String password, required String login}) async {
    try {
      final response = await dioContainer.dio.post(
        "/token",
        data: {"username": login, "password": password},
      );
      return UserDto.fromJson(response.data["data"]).toEntity();
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future singUp(
      {required String password,
      required String login,
      required String email}) {
    // TODO: implement singUp
    throw UnimplementedError();
  }

  @override
  Future userUpdate({String? login, String? email}) {
    // TODO: implement userUpdate
    throw UnimplementedError();
  }
}
