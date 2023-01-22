// import 'package:injectable/injectable.dart';
import 'package:otus_food_app/feature/auth/domain/auth_repository.dart';
import 'package:otus_food_app/feature/auth/domain/entities/user_entity/user_entity.dart';

// @Injectable(as: AuthRepository)
// @test
class MockAuthRepository implements AuthRepository {
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
  Future refreshToken({String? refreshToken}) {
    // TODO: implement refreshToken
    throw UnimplementedError();
  }

  @override
  Future singIn({required String password, required String login}) {
    return Future.delayed(const Duration(seconds: 2), () {
      //throw Exception("Test error");
      return UserEntity(
        email: "email",
        login: login,
        id: "-1",
      );
    });
  }

  @override
  Future singUp({
    required String password,
    required String login,
    required String email,
  }) {
    return Future.delayed(const Duration(seconds: 2), () {
      return UserEntity(
        email: email,
        login: login,
        id: "-1",
      );
    });
  }

  @override
  Future userUpdate({String? login, String? email}) {
    // TODO: implement userUpdate
    throw UnimplementedError();
  }
}
