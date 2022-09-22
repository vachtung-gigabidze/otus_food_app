import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

//rive animation
class HeartWidget extends StatelessWidget {
  const HeartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 30,
      width: 30,
      child: RiveAnimation.asset(
        'assets/animate/heart.riv',
        // fit: BoxFit.cover,
      ),
    );
  }
}

//flutter animation
// class HeartWidget extends StatefulWidget {
//   const HeartWidget({Key? key, required this.asset}) : super(key: key);

//   final String asset;

//   @override
//   _HeartWidgetState createState() => _HeartWidgetState();
// }

// class _HeartWidgetState extends State<HeartWidget>
//     with TickerProviderStateMixin {
//   bool _isPlaying = false;
//   late AnimationController _animationController;
//   late Animation<double> _pulseAnimation;

//   void animate() {
//     if (_isPlaying)
//       _animationController.stop();
//     else
//       _animationController.forward();

//     setState(() {
//       _isPlaying = !_isPlaying;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     _animationController =
//         AnimationController(vsync: this, duration: Duration(milliseconds: 500));

//     _pulseAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
//         CurvedAnimation(parent: _animationController, curve: Curves.easeIn));

//     _pulseAnimation.addStatusListener((status) {
//       if (status == AnimationStatus.completed)
//         _animationController.reverse();
//       else if (status == AnimationStatus.dismissed)
//         _animationController.forward();
//     });

//     animate();
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ScaleTransition(
//       scale: _pulseAnimation,
//       child: Image.asset(
//         widget.asset,
//         height: 30,
//         width: 30,
//       ),
//     );
//   }
// }
