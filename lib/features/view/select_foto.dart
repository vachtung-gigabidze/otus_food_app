import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget selectFoto() {
  return AnnotatedRegion<SystemUiOverlayStyle>(
    value: const SystemUiOverlayStyle(
      statusBarColor: Color(0xFFFFFFFF),
      statusBarIconBrightness: Brightness.dark,
    ),
    child: Scaffold(
      body: Center(
        child: SizedBox(
          height: 286,
          width: 428,
          child: Column(
            children: [
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Сфотографировать',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    fontSize: 16.0,
                    color: Color(0xFF000000),
                  ),
                ),
              ),
              const Divider(),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Выбрать из альбома',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    fontSize: 16.0,
                    color: Color(0xFF000000),
                  ),
                ),
              ),
              const Divider(),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Удалить',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    fontSize: 16.0,
                    color: Color(0xFFF54848),
                  ),
                ),
              ),
              SizedBox(
                height: 46,
                width: 401,
                child: TextButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24.0),
                      // side: BorderSide(color: Colors.red)
                    )),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFF2ECC71)),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Отмена',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      fontSize: 16.0,
                      color: Color(0xFF000000),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
