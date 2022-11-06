import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:otus_food_app/constants.dart';
import 'package:otus_food_app/feature/recipe_list/domain/entities/recipe_entity.dart';
// import 'package:otus_food_app/models/recipe_model.dart';
// import 'package:otus_food_app/model.dart';

class CheckBoxView extends StatefulWidget {
  const CheckBoxView({Key? key, this.cookingStepsStatus}) : super(key: key);
  final CookingStepsStatus? cookingStepsStatus;

  @override
  State<CheckBoxView> createState() => _CheckBoxViewState();
}

class _CheckBoxViewState extends State<CheckBoxView>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _pulseAnimation;

  void animate() {
    log('animate');
    _animationController.forward();
    // _animationController.reverse();
  }

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 100));

    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn));

    _pulseAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) _animationController.reverse();
      // else if (status == AnimationStatus.dismissed)
      //   _animationController.forward();
    });

    //log(widget.cookingStepsStatus!.toString());
  }

  @override
  void didUpdateWidget(covariant CheckBoxView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.cookingStepsStatus != widget.cookingStepsStatus) {
      animate();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _pulseAnimation,
      child: Image(
        image: AssetImage(Constants().checkBoxIcon(
            widget.cookingStepsStatus ?? CookingStepsStatus.notStarted)),
        height: 30,
        width: 30,
        fit: BoxFit.cover,
      ),
    );
  }
}
