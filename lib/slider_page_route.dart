import 'package:flutter/material.dart';

class SliderPageRoute extends PageRouteBuilder {
  final Widget widget;

  SliderPageRoute({required this.widget})
      : super(
            pageBuilder: (context, animation, secondaryAnimation) => widget,
            transitionDuration: const Duration(seconds: 1),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              animation =
                  CurvedAnimation(parent: animation, curve: Curves.easeOutBack);
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1, 0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            });
}
