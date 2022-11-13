import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otus_food_app/app/ui/app_loader.dart';
import 'package:otus_food_app/constants.dart';
import 'package:otus_food_app/feature/internet/domain/internet_state/internet_cubit.dart';
// import 'package:otus_food_app/feature/auth/ui/components/auth_builder.dart';
// import 'package:otus_food_app/feature/auth/ui/login_screen.dart';
// import 'package:otus_food_app/feature/main/main_screen.dart';
import 'package:otus_food_app/feature/recipe_list/ui/components/recipe_list_builder.dart';
import 'package:otus_food_app/feature/recipe_list/ui/recipe_list_screen.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InternetConnectionCubit, InternetConnectionState>(
        builder: (context, state) {
      return RecipeListBuilder(
        isEmpty: (context) => Scaffold(
          body: Center(
              child: state.connected
                  ? const Text('Не данных')
                  : const Text('Не соединения с интернетом')),
          backgroundColor: AppColors.accent,
        ),
        isWaiting: (context) => const AppLoader(),
        isLoaded: (context, value, child) => RecipesListScreen(
          recipes: value,
          isInternetConnectivity: state.connected,
        ),
      );
    });
    // return AuthBuilder(
    //   //Эту логику нужно привязать к кнопкам навигации и к доступу редактированию
    //   isNotAuthorized: (context) => LoginScreen(),
    //   isWaiting: (context) => const AppLoader(),
    //   isAuthorized: (context, value, child) => MainScreen(userEntity: value),
    // );
  }
}
