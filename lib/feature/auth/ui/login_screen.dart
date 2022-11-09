import 'package:flutter/material.dart';
import 'package:otus_food_app/app/ui/components/app_text_button.dart';
import 'package:otus_food_app/app/ui/components/app_text_field.dart';
import 'package:otus_food_app/feature/auth/domain/auth_state/auth_cubit.dart';
import 'package:otus_food_app/constants.dart';
import 'package:otus_food_app/feature/auth/ui/register_screen.dart';
import 'package:otus_food_app/feature/navbar/ui/bottom_nav_bar.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final controllerLogin = TextEditingController();
  final controllerPassword = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  void _onTapToSingIn(AuthCubit authCubit) => authCubit.singIn(
      login: controllerLogin.text, password: controllerPassword.text);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        bottomNavigationBar: const BottomNavBar(),
        // BottomNavigationBar(
        //   items: <BottomNavigationBarItem>[
        //     BottomNavigationBarItem(
        //       icon: ImageIcon(Image.asset(
        //         Constants.iconPizza,
        //         height: 24,
        //         width: 24,
        //       ).image),
        //       label: 'Рецепты',
        //       backgroundColor: Colors.white,
        //     ),
        //     BottomNavigationBarItem(
        //       icon: ImageIcon(Image.asset(
        //         Constants.iconProfile,
        //         height: 24,
        //         width: 24,
        //       ).image),
        //       label: 'Вход',
        //     ),
        //   ],

        //   currentIndex: 0,
        //   showUnselectedLabels: true,
        //   selectedItemColor: AppColors.accent,
        //   unselectedItemColor: AppColors.greyColor,
        //   // onTap: () {},
        // ),
        backgroundColor: const Color(0xFF2ECC71),
        body: Stack(
          children: [
            Center(
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
                  AppTextField(
                    controller: controllerLogin,
                    labelText: 'логин',
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
                    height: 40,
                  ),
                  SizedBox(
                      height: 48,
                      width: 232,
                      child: AppTextButton(
                          onPressed: () {
                            if (formKey.currentState?.validate() == true) {
                              _onTapToSingIn(context.read<AuthCubit>());
                            }
                          },
                          text: 'Войти')),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => RegisterScreen()));
                },
                child: const Text(
                  'Зарегистрироваться',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w400,
                    fontSize: 14.0,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
