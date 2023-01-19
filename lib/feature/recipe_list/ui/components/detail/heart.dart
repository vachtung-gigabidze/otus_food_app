import 'package:flutter/material.dart';
import 'package:otus_food_app/constants.dart';
import 'package:rive/rive.dart';

class HeartWidget extends StatelessWidget {
  const HeartWidget({Key? key, this.animate = false, required this.heatTap})
      : super(key: key);

  final bool animate;

  final Function heatTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => heatTap,
        child: animate
            ? const SizedBox(
                height: 30,
                width: 30,
                child: RiveAnimation.asset(
                  'assets/animate/heart.riv',
                ),
              )
            : Image.asset(
                Constants.iconHeartBlack,
                height: 30,
                width: 30,
              ));
  }
}
