import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class HeartWidget extends StatelessWidget {
  const HeartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 30,
      width: 30,
      child: RiveAnimation.asset(
        'assets/animate/heart.riv',
      ),
    );
  }
}
