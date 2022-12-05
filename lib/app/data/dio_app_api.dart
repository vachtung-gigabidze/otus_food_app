import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:otus_food_app/app/domain/app_api.dart';
import 'package:otus_food_app/app/domain/app_config.dart';
import 'package:otus_food_app/feature/auth/data/auth_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@Singleton(as: AppApi)
class DioAppApi implements AppApi {
  late final Dio dio;

  DioAppApi(AppConfig appConfig) {
    final options = BaseOptions(
      baseUrl: appConfig.baseUrl,
      connectTimeout: 15000,
    );

    dio = Dio(options);
    if (kDebugMode) addInterceptor(PrettyDioLogger());

    addInterceptor(AuthInterceptor());
  }

  void addInterceptor(Interceptor interceptor) {
    if (dio.interceptors.contains(interceptor)) {
      dio.interceptors.remove(interceptor);
    }

    deleteInterceptor(interceptor.runtimeType);

    dio.interceptors.add(interceptor);
  }

  void deleteInterceptor(Type type) {
    dio.interceptors.removeWhere((element) => element.runtimeType == type);
  }

  @override
  Future<Response> getProfile() {
    try {
      return dio.get("/user");
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> passwordUpdate(
      {required String? oldPassword, required String? newPassword}) {
    // TODO: implement passwordUpdate
    throw UnimplementedError();
  }

  @override
  Future<Response> refreshToken({String? refreshToken}) {
    try {
      return dio.post(
        "/token/$refreshToken",
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> singIn({required String password, required String login}) {
    try {
      return dio
          .post("/token", data: {"username": login, "password": password});
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> singUp(
      {required String password,
      required String login,
      required String email}) {
    try {
      return dio.put(
        "/token",
        data: {
          "username": login,
          "password": password,
          "email": email,
        },
      );
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> userUpdate({String? login, String? email}) {
    // TODO: implement userUpdate
    throw UnimplementedError();
  }

  @override
  Future<Response> getAllRecipe() {
    try {
      return dio.get("/recipe");
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<Response> request(String path) {
    try {
      return dio.request(path);
    } catch (_) {
      rethrow;
    }
  }
}