import 'package:flutter/material.dart';
import 'package:otus_food_app/constants.dart';
import 'package:otus_food_app/model.dart';

class CheckBoxView extends StatefulWidget {
  const CheckBoxView({Key? key, this.cookingStepsStatus}) : super(key: key);
  final CookingStepsStatus? cookingStepsStatus;

  @override
  State<CheckBoxView> createState() => _CheckBoxViewState();
}

class _CheckBoxViewState extends State<CheckBoxView>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: Image(
        image: AssetImage(Constants().checkBoxIcon(widget.cookingStepsStatus!)),
        height: 30,
        width: 30,
        fit: BoxFit.cover,
      ),
    );
  }
}
