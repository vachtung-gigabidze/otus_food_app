import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:otus_food_app/feature/auth/domain/auth_repository.dart';
import 'package:otus_food_app/feature/auth/domain/entities/user_entity/user_entity.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepository) : super(AuthState.notAuthorized());

  final AuthRepository authRepository;

  Future<void> singIn({required String login, required String password}) async {
    emit(AuthState.waiting());
    try {
      final UserEntity userEntity =
          await authRepository.singIn(password: password, login: login);
      emit(AuthState.authorized(userEntity));
    } catch (error) {
      emit(AuthState.error(error));
      rethrow;
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
    } catch (error) {
      emit(AuthState.error(error));
      rethrow;
    }
  }
}
