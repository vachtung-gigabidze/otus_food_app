import 'package:flutter/material.dart';

import 'package:otus_food_app/screens/favorites_screen.dart';
import 'package:otus_food_app/screens/fridge_screen.dart';
import 'package:otus_food_app/screens/login_screen.dart';
import 'package:otus_food_app/screens/logo_screen.dart';
import 'package:otus_food_app/screens/profile_screen.dart';
import 'package:otus_food_app/screens/recept_detail.dart';
import 'package:otus_food_app/screens/recipes_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    '/recipes': (BuildContext context) => const RecipesList(),
    '/detail': (BuildContext context) => RecipeDetail(),
    '/login': (BuildContext context) => const LoginScreen(),
    '/logo': (BuildContext context) => const LogoScreen(nextRoute: '/recipes'),
    '/fridge': (BuildContext context) => const FridgeScreen(),
    '/favorites': (BuildContext context) => const FavoritesScreen(),
    '/profile': (BuildContext context) => const ProfileScreen()
  };

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Otus Food App',
      routes: routes,
      initialRoute: '/logo',
    );
  }
}
