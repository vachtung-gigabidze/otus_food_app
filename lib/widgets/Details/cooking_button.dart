import 'package:flutter/material.dart';

Widget cookingButton() {
  return SizedBox(
    height: 48,
    width: 232,
    child: TextButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
          // side: BorderSide(color: Colors.red)
        )),
        backgroundColor:
            MaterialStateProperty.all<Color>(const Color(0xFF165932)),
      ),
      onPressed: () {},
      child: const Text(
        'Начать готовить',
        style: TextStyle(
          fontFamily: 'Roboto',
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
          color: Color(0xFFFFFFFF),
        ),
      ),
    ),
  );
}

Widget checkIngredients() {
  return Container(
    height: 48,
    width: 232,
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(25.0)),
      border: Border.all(
          color: const Color(0xFF165932), width: 3.0, style: BorderStyle.solid),
    ),
    child: TextButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
          // side: BorderSide(color: Colors.red)
        )),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
      ),
      onPressed: () {},
      child: const Text(
        'Проверить наличие',
        style: TextStyle(
          fontFamily: 'Roboto',
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
          color: Color(0xFF165932),
        ),
      ),
    ),
  );
}
