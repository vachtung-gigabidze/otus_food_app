import 'dart:async';

import 'package:flutter/material.dart';
import 'package:otus_food_app/widgets/logo.dart';

class LogoScreen extends StatefulWidget {
  final String nextRoute;

  const LogoScreen({Key? key, required this.nextRoute}) : super(key: key);

  @override
  State<LogoScreen> createState() => _LogoScreenState();
}

class _LogoScreenState extends State<LogoScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed(widget.nextRoute);
    });
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
