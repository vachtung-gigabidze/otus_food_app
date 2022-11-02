import 'package:flutter/material.dart';
import 'package:otus_food_app/app/ui/app_loader.dart';
import 'package:otus_food_app/feature/auth/ui/components/auth_builder.dart';
import 'package:otus_food_app/feature/auth/ui/login_screen.dart';
import 'package:otus_food_app/feature/main/main_screen.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBuilder(
      //Эту логику нужно привязать к кнопкам навигации и к доступу редактированию
      isNotAuthorized: (context) => LoginScreen(),
      isWaiting: (context) => const AppLoader(),
      isAuthorized: (context, value, child) => MainScreen(userEntity: value),
    );
  }
}
