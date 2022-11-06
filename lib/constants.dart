import 'package:flutter/material.dart';
import 'package:otus_food_app/feature/recipe_list/domain/entities/recipe_entity.dart';
// import 'package:otus_food_app/models/recipe_model.dart';
// import 'package:otus_food_app/model.dart';

// ignore: constant_identifier_names
class Constants {
  static const String logoIMAGE = 'assets/images/logo.png';
  // static const String avatar_1 = 'assets/images/avatar_1.png';
  // static const String commentImage_1 = 'assets/images/comment_image_1.png';
  static const String imageIcon = 'assets/icons/image_green.png';
  static const String lockIcon = 'assets/icons/lock_grey.png';
  static const String flagIcon = 'assets/icons/flag_green.png';

  // static const String IMAGE1 = 'assets/images/1.png';
  // static const String IMAGE2 = 'assets/images/2.png';
  // static const String IMAGE3 = 'assets/images/3.png';
  // static const String IMAGE4 = 'assets/images/4.png';
  // static const String IMAGE5 = 'assets/images/5.png';
  // static const String IMAGE6 = 'assets/images/6.png';
  // static const String IMAGE7 = 'assets/images/7.png';
  static const String iconPizza = 'assets/icons/pizza_green.png';
  static const String iconFridge = 'assets/icons/fridge_green.png';
  static const String iconHeartBlack = 'assets/icons/heart_black.png';
  static const String iconHeartRed = 'assets/icons/heart_red.png';
  static const String iconHeartGreen = 'assets/icons/heart_green.png';
  static const String iconProfile = 'assets/icons/profile_green.png';

  static const String imageProfile = 'assets/images/profile.png';

  static const String iconMegaphone = 'assets/icons/megaphone.png';
  static const String iconClock = 'assets/icons/clock.png';
  static const String checkboxPassed = 'assets/icons/checkbox_passed.png';
  static const String checkboxNoPassed = 'assets/icons/checkbox_noPassed.png';
  static const String checkboxNoStarted = 'assets/icons/checkbox_noStarted.png';

  String checkBoxIcon(CookingStepsStatus cookingStepsStatus) {
    switch (cookingStepsStatus) {
      case CookingStepsStatus.notStarted:
        return checkboxNoStarted;
      case CookingStepsStatus.notPassed:
        return checkboxNoPassed;
      case CookingStepsStatus.passed:
        return checkboxPassed;
      default:
        return checkboxNoStarted;
    }
  }
}

//enum CookingStepsStatus { noStart, start, complete }

class AppColors {
  static const Color main = Color(0xFF165932);
  static const Color accent = Color(0xFF2ECC71);
  static const Color greyColor = Color(0xFFC2C2C2);

  Color stepBackground(CookingStepsStatus cookingStepsStatus) {
    switch (cookingStepsStatus) {
      case CookingStepsStatus.notStarted:
        return stepBackgroundNoStart;
      case CookingStepsStatus.notPassed:
        return stepBackgroundStart;
      case CookingStepsStatus.passed:
        return stepBackgroundStart;
      default:
        return stepBackgroundNoStart;
    }
  }

  Color stepOrder(CookingStepsStatus cookingStepsStatus) {
    switch (cookingStepsStatus) {
      case CookingStepsStatus.notStarted:
        return stepOrderNoStart;
      case CookingStepsStatus.notPassed:
        return stepOrderStart;
      case CookingStepsStatus.passed:
        return stepOrderStart;
      default:
        return stepOrderNoStart;
    }
  }

  Color stepText(CookingStepsStatus? cookingStepsStatus) {
    switch (cookingStepsStatus) {
      case CookingStepsStatus.notStarted:
        return stepTextNoStart;
      case CookingStepsStatus.notPassed:
        return stepTextStart;
      case CookingStepsStatus.passed:
        return stepTextStart;
      default:
        return stepTextNoStart;
    }
  }

  Color stepCheckbox(CookingStepsStatus? cookingStepsStatus) {
    switch (cookingStepsStatus) {
      case CookingStepsStatus.notStarted:
        return stepCheckboxNoStart;
      case CookingStepsStatus.notPassed:
        return stepCheckboxStart;
      case CookingStepsStatus.passed:
        return stepCheckboxStart;
      default:
        return stepCheckboxNoStart;
    }
  }

  //grey
  static const Color stepBackgroundNoStart = Color.fromARGB(255, 236, 236, 236);
  static const Color stepOrderNoStart = Color.fromARGB(255, 194, 194, 194);
  static const Color stepTextNoStart = Color.fromARGB(255, 121, 118, 118);
  static const Color stepCheckboxNoStart = Color.fromARGB(255, 121, 118, 118);
  // static const Color step_duration_nostart = Color.fromARGB(255, 121, 118, 118);

  //green
  static const Color stepBackgroundStart = Color(0xFFe0f8ea);
  static const Color stepOrderStart = Color.fromRGBO(46, 204, 113, 1);
  static const Color stepTextStart = Color(0xFF2D490C);
  static const Color stepCheckboxStart = Color(0xFF165932);
  // static const Color step_duration_start = Color(0xFF165932);
}
