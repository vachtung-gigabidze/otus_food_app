import 'package:flutter/material.dart';

import 'package:otus_food_app/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2ECC71),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Otus.Food',
              style: TextStyle(
                fontFamily: 'Roboto',
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w400,
                fontSize: 30.0,
                color: Color(0xFFFFFFFF),
              ),
            ),
            const SizedBox(
              height: 81,
            ),
            SizedBox(
              height: 48,
              width: 232,
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hoverColor: Colors.white,
                  prefixIcon: GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        color: Colors.transparent,
                        constraints: const BoxConstraints(
                          maxHeight: 24.0,
                          maxWidth: 24.0,
                        ),
                        child: const Image(
                          image: AssetImage(
                            Constants.iconProfile,
                          ),
                          color: Color(0xFFC2C2C2),
                          height: 24,
                          width: 24,
                        ),
                      )),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      color: Color(0xFFFFFFFF),
                      width: 2,
                      style: BorderStyle.solid,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      color: Color(0xFFFFFFFF),
                      width: 2,
                      style: BorderStyle.solid,
                    ),
                  ),
                  hintText: 'логин',
                  hintStyle: const TextStyle(
                    height: 2.0,
                    fontFamily: 'Roboto',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                    color: Color(0xFFC2C2C2),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 48,
              width: 232,
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hoverColor: Colors.white,
                  prefixIcon: GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        color: Colors.transparent,
                        constraints: const BoxConstraints(
                          maxHeight: 24.0,
                          maxWidth: 24.0,
                        ),
                        child: const Image(
                          image: AssetImage(
                            Constants.iconProfile,
                          ),
                          color: Color(0xFFC2C2C2),
                          height: 24,
                          width: 24,
                        ),
                      )),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      color: Color(0xFFFFFFFF),
                      width: 2,
                      style: BorderStyle.solid,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      color: Color(0xFFFFFFFF),
                      width: 2,
                      style: BorderStyle.solid,
                    ),
                  ),
                  hintText: 'пароль',
                  hintStyle: const TextStyle(
                    height: 2.0,
                    fontFamily: 'Roboto',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                    color: Color(0xFFC2C2C2),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 48,
              width: 232,
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hoverColor: Colors.white,
                  prefixIcon: GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        color: Colors.transparent,
                        constraints: const BoxConstraints(
                          maxHeight: 24.0,
                          maxWidth: 24.0,
                        ),
                        child: const Image(
                          image: AssetImage(
                            Constants.iconProfile,
                          ),
                          color: Color(0xFFC2C2C2),
                          height: 24,
                          width: 24,
                        ),
                      )),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      color: Color(0xFFFFFFFF),
                      width: 2,
                      style: BorderStyle.solid,
                    ),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      color: Color(0xFFFFFFFF),
                      width: 2,
                      style: BorderStyle.solid,
                    ),
                  ),
                  hintText: 'пароль еще раз',
                  hintStyle: const TextStyle(
                    height: 2.0,
                    fontFamily: 'Roboto',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.0,
                    color: Color(0xFFC2C2C2),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            TextButton(
              onPressed: () {},
              child: Text('Войти'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Зарегистрироваться'),
            ),
          ],
        ),
      ),
    );
  }
}
