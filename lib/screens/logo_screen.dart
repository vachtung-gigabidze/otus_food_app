import 'package:flutter/material.dart';
import 'package:otus_food_app/widgets/logo.dart';

class LogoScreen extends StatelessWidget {
  const LogoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Otus Food App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: const TextTheme(bodyText2: TextStyle(color: Colors.purple)),
      ),
      home: Scaffold(
          body: Center(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.0, 0.0),
              end: Alignment(0.308, 0.951),
              colors: <Color>[
                Color(0xFF2ECC71),
                Color(0xFF165932),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: logoWidget()),
            ],
          ),
        ),
      )),
    );
  }
}
