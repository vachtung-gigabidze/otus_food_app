import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:otus_food_app/feature/logo/ui/components/logo.dart';
import 'package:otus_food_app/widgets/status_style.dart';

class LogoScreen extends StatefulWidget {
  const LogoScreen({Key? key, required this.nextRoute}) : super(key: key);

  final String nextRoute;

  @override
  State<LogoScreen> createState() => _LogoScreenState();
}

class _LogoScreenState extends State<LogoScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      // context.go(widget.nextRoute);
      Navigator.of(context).pushReplacementNamed(widget.nextRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: StatusOverlay.green,
      child: Scaffold(
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
