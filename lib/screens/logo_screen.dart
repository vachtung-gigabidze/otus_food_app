import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:otus_food_app/api/recept_api.dart';
import 'package:otus_food_app/model.dart';
import 'package:otus_food_app/widgets/Logo/logo.dart';

class LogoScreen extends StatefulWidget {
  final String nextRoute;

  const LogoScreen({Key? key, required this.nextRoute}) : super(key: key);

  @override
  State<LogoScreen> createState() => _LogoScreenState();
}

class _LogoScreenState extends State<LogoScreen> {
  void getRecept() async {
    Timer(const Duration(seconds: 2), () async {
      try {
        RecipesModel recepts = await ReceptApi().fetchRecipets();

        if (recepts.recipes!.isNotEmpty) {
          Navigator.of(context)
              .pushReplacementNamed(widget.nextRoute, arguments: recepts);
        }
      } catch (e) {
        log('$e');
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getRecept();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    ));
  }
}
