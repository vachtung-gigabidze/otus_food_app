import 'package:flutter/material.dart';
import 'package:otus_food_app/app/ui/components/app_text_button.dart';
import 'package:otus_food_app/app/ui/components/app_text_field.dart';
import 'package:otus_food_app/constants.dart';
import 'package:otus_food_app/feature/auth/domain/auth_state/auth_cubit.dart';
// import 'package:otus_food_app/constants.dart';
import 'package:otus_food_app/feature/auth/ui/register_screen.dart';
import 'package:otus_food_app/feature/navbar/ui/bottom_nav_bar.dart';
import 'package:otus_food_app/feature/recipe_list/domain/recipe_list_state/recipe_list_cubit.dart';
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
    final isKeyboardShow = MediaQuery.of(context).viewInsets.bottom != 0;
    return Form(
      key: formKey,
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        bottomNavigationBar: const BottomNavBar(screenIdx: 1),
        backgroundColor: const Color(0xFF2ECC71),
        body: Stack(
          children: [
            Center(
              child: SingleChildScrollView(
                // reverse: true,
                // padding: const EdgeInsets.all(32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (!isKeyboardShow)
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
                      iconName: Constants.lockIcon,
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
                                context.read<RecipeListCubit>().getRecipeList();
                              }
                            },
                            text: 'Войти')),
                  ],
                ),
              ),
            ),
            if (!isKeyboardShow)
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
