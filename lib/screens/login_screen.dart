import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
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
            //  TextField(),
            //   TextField(),
            //   TextField(),
            TextButton(
              onPressed: () {},
              child: Text('Войти'),
            ),
            TextButton(
              onPressed: () {},
              child: Text('Зарегистрироваться'),
            ),
          ],
        ),
      ),
    );
  }
}
