import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:otus_food_app/feature/auth/domain/auth_repository.dart';
import 'package:otus_food_app/feature/auth/domain/entities/user_entity/user_entity.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';
part 'auth_cubit.g.dart';

class AuthCubit extends HydratedCubit<AuthState> {
  AuthCubit(this.authRepository) : super(AuthState.notAuthorized());

  final AuthRepository authRepository;

  Future<void> singIn({required String login, required String password}) async {
    emit(AuthState.waiting());
    try {
      final UserEntity userEntity =
          await authRepository.singIn(password: password, login: login);
      emit(AuthState.authorized(userEntity));
    } catch (error, st) {
      addError(error, st);
    }
  }

  Future<void> singUp({
    required String login,
    required String password,
    required String email,
  }) async {
    emit(AuthState.waiting());
    try {
      final UserEntity userEntity = await authRepository.singUp(
        password: password,
        login: login,
        email: email,
      );
      emit(AuthState.authorized(userEntity));
    } catch (error, st) {
      addError(error, st);
    }
  }

  Future<void> refreshToken() async {
    final refreshToken =
        state.whenOrNull(authorized: (userEntity) => userEntity.refreshToken);
    try {
      final UserEntity userEntity =
          await authRepository.refreshToken(refreshToken: refreshToken);
      emit(AuthState.authorized(userEntity));
    } catch (error, st) {
      addError(error, st);
    }
  }

  void logOut() => emit(AuthState.notAuthorized());

  @override
  AuthState? fromJson(Map<String, dynamic> json) {
    final state = AuthState.fromJson(json);
    return state.whenOrNull(
      authorized: (userEntity) => AuthState.authorized(userEntity),
    );
  }

  @override
  Map<String, dynamic>? toJson(AuthState state) {
    return state
            .whenOrNull(
              authorized: (userEntity) => AuthState.authorized(userEntity),
            )
            ?.toJson() ??
        AuthState.notAuthorized().toJson();
  }

  @override
  void addError(Object error, [StackTrace? stackTrace]) {
    emit(AuthState.error(error));
    super.addError(error, stackTrace);
  }
}
