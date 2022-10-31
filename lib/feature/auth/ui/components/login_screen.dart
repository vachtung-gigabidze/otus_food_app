import 'package:flutter/material.dart';
import 'package:otus_food_app/app/ui/components/app_text_button.dart';
import 'package:otus_food_app/app/ui/components/app_text_field.dart';
import 'package:otus_food_app/constants.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final controller = TextEditingController();
  final controllerPassword = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: ImageIcon(Image.asset(
                Constants.iconPizza,
                height: 24,
                width: 24,
              ).image),
              label: 'Рецепты',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(Image.asset(
                Constants.iconProfile,
                height: 24,
                width: 24,
              ).image),
              label: 'Вход',
            ),
          ],

          currentIndex: 0,
          showUnselectedLabels: true,
          selectedItemColor: AppColors.accent,
          unselectedItemColor: AppColors.greyColor,
          // onTap: () {},
        ),
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
                  SizedBox(
                    height: 48,
                    width: 232,
                    child: AppTextField(
                      controller: controller,
                      labelText: 'логин',
                      obscureText: false,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 48,
                    width: 232,
                    child: AppTextField(
                      controller: controllerPassword,
                      labelText: 'пароль',
                      obscureText: true,
                    ),
                  ),
                  // const SizedBox(
                  //   height: 16,
                  // ),
                  // SizedBox(
                  //   height: 48,
                  //   width: 232,
                  //   child: TextField(
                  //     decoration: InputDecoration(
                  //       filled: true,
                  //       fillColor: Colors.white,
                  //       hoverColor: Colors.white,
                  //       prefixIcon: GestureDetector(
                  //           onTap: () {},
                  //           child: Container(
                  //             padding: const EdgeInsets.all(10.0),
                  //             color: Colors.transparent,
                  //             constraints: const BoxConstraints(
                  //               maxHeight: 24.0,
                  //               maxWidth: 24.0,
                  //             ),
                  //             child: const Image(
                  //               image: AssetImage(
                  //                 Constants.lockIcon,
                  //               ),
                  //               color: Color(0xFFC2C2C2),
                  //               height: 24,
                  //               width: 24,
                  //             ),
                  //           )),
                  //       enabledBorder: const OutlineInputBorder(
                  //         borderRadius: BorderRadius.all(Radius.circular(10)),
                  //         borderSide: BorderSide(
                  //           color: Color(0xFFFFFFFF),
                  //           width: 2,
                  //           style: BorderStyle.solid,
                  //         ),
                  //       ),
                  //       focusedBorder: const OutlineInputBorder(
                  //         borderRadius: BorderRadius.all(Radius.circular(10)),
                  //         borderSide: BorderSide(
                  //           color: Color(0xFFFFFFFF),
                  //           width: 2,
                  //           style: BorderStyle.solid,
                  //         ),
                  //       ),
                  //       hintText: 'пароль еще раз',
                  //       hintStyle: const TextStyle(
                  //         height: 2.0,
                  //         fontFamily: 'Roboto',
                  //         fontStyle: FontStyle.normal,
                  //         fontWeight: FontWeight.w500,
                  //         fontSize: 16.0,
                  //         color: Color(0xFFC2C2C2),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                      height: 48,
                      width: 232,
                      child: AppTextButton(
                          onPressed: () {
                            if (formKey.currentState?.validate() == true) {
                              print("OK");
                            }
                          },
                          text: 'Войти')),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: TextButton(
                onPressed: () {},
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
