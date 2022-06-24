import 'package:flutter/material.dart';

Widget CookingButton() {
  return
      //  TextButton(
      //     child: Text("TextButton With Background and Foreground Color"),
      //     onPressed: () {},
      //     style: ButtonStyle(
      //       backgroundColor: MaterialStateProperty.all<Color>(Colors.greenAccent),
      //       foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
      //     ));
      Container(
    height: 48,
    width: 232,
    //color: Colors.black,
    // decoration: BoxDecoration(
    //   border: Border.all(
    //     color: Colors.black,
    //     width: 2,
    //     style: BorderStyle.solid,
    //   ),
    // borderRadius: BorderRadius.all(Radius.circular(25)),
    // ),
    child: TextButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.0),
          // side: BorderSide(color: Colors.red)
        )),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
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
