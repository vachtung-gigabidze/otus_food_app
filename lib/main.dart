import 'package:flutter/material.dart';
// import 'package:otus_food_app/features/view/select_foto.dart';
import 'package:otus_food_app/screens/favourites_screen.dart';
import 'package:otus_food_app/screens/fridge_screen.dart';
import 'package:otus_food_app/screens/login_screen.dart';
import 'package:otus_food_app/screens/logo_screen.dart';
import 'package:otus_food_app/screens/profile_screen.dart';
// import 'package:flutter/services.dart';
// import 'package:otus_food_app/screens/logo_screen.dart';
import 'package:otus_food_app/screens/recept_detail.dart';
import 'package:otus_food_app/screens/recipes_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    '/recepts': (BuildContext context) => const ReceptsList(),
    '/details': (BuildContext context) => ReceptDetail(),
    '/login': (BuildContext context) => const LoginScreen(),
    '/logo': (BuildContext context) => LogoScreen(nextRoute: '/recepts'),
    '/fridge': (BuildContext context) => const FridgeScreen(),
    '/favourite': (BuildContext context) => const FavouritesScreen(),
    '/profile': (BuildContext context) => const ProfileScreen(),
  };

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Otus Food App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: const TextTheme(bodyText2: TextStyle(color: Colors.purple)),
      ),
      //home: //ReceptDetail(),
      //ProfileScreen(),
      //  selectFoto(),
      // FavouritesScreen(),
      // FridgeScreen(),
      //LoginScreen(),
      //  LogoScreen(nextRoute: '/Login'),
      routes: routes,
      initialRoute: '/logo',
    );
  }
}
