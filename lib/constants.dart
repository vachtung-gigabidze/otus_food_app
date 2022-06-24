import 'package:flutter/material.dart';
import 'package:otus_food_app/model.dart';

// ignore: constant_identifier_names
class Constants {
  static const String LOGO_IMAGE = 'assets/images/logo.png';
  // static const String IMAGE1 = 'assets/images/1.png';
  // static const String IMAGE2 = 'assets/images/2.png';
  // static const String IMAGE3 = 'assets/images/3.png';
  // static const String IMAGE4 = 'assets/images/4.png';
  // static const String IMAGE5 = 'assets/images/5.png';
  // static const String IMAGE6 = 'assets/images/6.png';
  // static const String IMAGE7 = 'assets/images/7.png';
  static const String ICON_CLOCK = 'assets/icons/clock.png';
  static const String checkbox_passed = 'assets/icons/checkbox_passed.png';
  static const String checkbox_nopassed = 'assets/icons/checkbox_nopassed.png';
  static const String checkbox_noStarted =
      'assets/icons/checkbox_noStarted.png';

  String checkBox_icon(CookingStepsStatus cookingStepsStatus) {
    switch (cookingStepsStatus) {
      case CookingStepsStatus.notStarted:
        return checkbox_noStarted;
      case CookingStepsStatus.notPassed:
        return checkbox_nopassed;
      case CookingStepsStatus.passed:
        return checkbox_passed;
      default:
        return checkbox_noStarted;
    }
  }
}

//enum CookingStepsStatus { nostart, start, complite }

class AppColors {
  static const Color main = Color(0xFF24282F);
  static const Color accent = Color(0xFF3C3E44);
  static const Color greyColor = Color(0xFFECECEC);

  Color step_back(CookingStepsStatus cookingStepsStatus) {
    switch (cookingStepsStatus) {
      case CookingStepsStatus.notStarted:
        return step_back_nostart;
      case CookingStepsStatus.notPassed:
        return step_back_start;
      case CookingStepsStatus.passed:
        return step_back_start;
      default:
        return step_back_nostart;
    }
  }

  Color step_order(CookingStepsStatus cookingStepsStatus) {
    switch (cookingStepsStatus) {
      case CookingStepsStatus.notStarted:
        return step_order_nostart;
      case CookingStepsStatus.notPassed:
        return step_order_start;
      case CookingStepsStatus.passed:
        return step_order_start;
      default:
        return step_order_nostart;
    }
  }

  Color step_text(CookingStepsStatus cookingStepsStatus) {
    switch (cookingStepsStatus) {
      case CookingStepsStatus.notStarted:
        return step_text_nostart;
      case CookingStepsStatus.notPassed:
        return step_text_start;
      case CookingStepsStatus.passed:
        return step_text_start;
      default:
        return step_text_nostart;
    }
  }

  Color step_checkbox(CookingStepsStatus cookingStepsStatus) {
    switch (cookingStepsStatus) {
      case CookingStepsStatus.notStarted:
        return step_checkbox_nostart;
      case CookingStepsStatus.notPassed:
        return step_checkbox_start;
      case CookingStepsStatus.passed:
        return step_checkbox_start;
      default:
        return step_checkbox_nostart;
    }
  }

  //grey
  static const Color step_back_nostart = Color.fromARGB(255, 236, 236, 236);
  static const Color step_order_nostart = Color.fromARGB(255, 194, 194, 194);
  static const Color step_text_nostart = Color.fromARGB(255, 121, 118, 118);
  static const Color step_checkbox_nostart = Color.fromARGB(255, 121, 118, 118);
  // static const Color step_duration_nostart = Color.fromARGB(255, 121, 118, 118);

  //green
  static const Color step_back_start = Color(0xFF2ECC71);
  static const Color step_order_start = Color(0xFF2ECC71);
  static const Color step_text_start = Color(0xFF2D490C);
  static const Color step_checkbox_start = Color(0xFF165932);
  // static const Color step_duration_start = Color(0xFF165932);
}
