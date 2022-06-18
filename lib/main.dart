import 'package:flutter/material.dart';
import 'package:otus_food_app/screens/logo_screen.dart';
import 'package:otus_food_app/screens/recipes_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    // The path that creates the Home Screen
    '/Home': (BuildContext context) => ReceptsList()
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Otus Food App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: const TextTheme(bodyText2: TextStyle(color: Colors.purple)),
      ),
      home: LogoScreen(
        nextRoute: '/Home',
      ),
      routes: routes,
    );
  }
}
