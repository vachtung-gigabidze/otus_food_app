import 'package:flutter/material.dart';
import 'package:otus_food_app/app/ui/components/app_text_button.dart';
import 'package:otus_food_app/app/ui/components/app_text_field.dart';
import 'package:otus_food_app/feature/auth/domain/auth_state/auth_cubit.dart';
import 'package:otus_food_app/feature/navbar/ui/bottom_nav_bar.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final controllerLogin = TextEditingController();
  final controllerPassword = TextEditingController();
  final controllerRepeatPassword = TextEditingController();
  final controllerEmail = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  void _onTapToSingUp(AuthCubit authCubit) => authCubit.singUp(
        login: controllerLogin.text,
        password: controllerPassword.text,
        email: controllerEmail.text,
      );

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        bottomNavigationBar: const BottomNavBar(),
        backgroundColor: const Color(0xFF2ECC71),
        body: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppTextField(
                    controller: controllerLogin,
                    labelText: 'логин',
                    obscureText: false,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  AppTextField(
                    controller: controllerEmail,
                    labelText: 'эл.почта',
                    obscureText: false,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  AppTextField(
                    controller: controllerPassword,
                    labelText: 'пароль',
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  AppTextField(
                    controller: controllerRepeatPassword,
                    labelText: 'повторите пароль',
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  AppTextButton(
                      onPressed: () {
                        if (formKey.currentState?.validate() == true) {
                          if (controllerPassword.text !=
                              controllerRepeatPassword.text) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text("Пароли не совпадают")));
                          } else {
                            _onTapToSingUp(context.read<AuthCubit>());
                            Navigator.of(context).pop();
                          }
                        }
                      },
                      text: 'Регистрация'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}