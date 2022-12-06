import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otus_food_app/app/domain/error_entity/error_entity.dart';
import 'package:otus_food_app/app/ui/components/app_snackbar.dart';
import 'package:otus_food_app/feature/auth/domain/auth_state/auth_cubit.dart';

class AuthBuilder extends StatelessWidget {
  const AuthBuilder({
    super.key,
    required this.isNotAuthorized,
    required this.isWaiting,
    required this.isAuthorized,
  });

  final WidgetBuilder isNotAuthorized;
  final WidgetBuilder isWaiting;
  final ValueWidgetBuilder isAuthorized;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
        builder: (context, state) => state.when(
              notAuthorized: () => isNotAuthorized(context),
              authorized: (userEntity) =>
                  isAuthorized(context, userEntity, this),
              waiting: () => isWaiting(context),
              error: (error) => isNotAuthorized(context),
            ),
        listenWhen: ((previous, current) =>
            previous.mapOrNull(
              error: (value) => value,
            ) !=
            current.mapOrNull(
              error: (value) => value,
            )),
        listener: (context, state) {
          state.whenOrNull(
            error: (error) => AppSnackBar.showSnackBarWithError(
                context, ErrorEntity.fromException(error)),
          );
        });
  }

  // void _showSnackBar(BuildContext context, ErrorEntity error) {
  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //       duration: const Duration(seconds: 5),
  //       content: SingleChildScrollView(
  //         child: Text(maxLines: 5, error.show()),
  //       )));
  // }
}
