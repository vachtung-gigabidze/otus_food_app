class RecipeUtils {
  static String showTime(int cookingTime) {
    int hour = cookingTime ~/ 3600;
    int minute = (cookingTime - (hour * 3600)) ~/ 60;
    int second = (cookingTime - (hour * 3600)) % 60;

    String hourStr = hour != 0
        ? hour < 10
            ? '0$hour:'
            : '$hour:'
        : '';
    String minuteStr = minute < 10 ? '0$minute:' : '$minute:';

    String secondStr = second < 10 ? '0$second' : '$second';

    return hourStr + minuteStr + secondStr;
  }

  static String nameTime(int cookingTime) {
    int hour = cookingTime ~/ 3600;
    int minute = (cookingTime - (hour * 3600)) ~/ 60;

    String hourStr = (hour == 1)
        ? '$hour час '
        : (hour >= 2 && hour <= 4)
            ? '$hour часа '
            : (hour == 0)
                ? ''
                : '$hour часов ';
    String minuteStr = (minute == 1)
        ? '$minute минута'
        : (minute >= 2 && minute <= 4)
            ? '$minute минуты'
            : (minute == 0)
                ? ''
                : '$minute минут';

    return '$hourStr$minuteStr';
  }
}
