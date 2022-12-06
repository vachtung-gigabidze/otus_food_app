import 'package:flutter/material.dart';
import 'package:otus_food_app/app/ui/components/app_text_button.dart';
import 'package:otus_food_app/app/ui/components/app_text_field.dart';
import 'package:otus_food_app/constants.dart';
import 'package:otus_food_app/feature/navbar/ui/bottom_nav_bar.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:otus_food_app/feature/auth/domain/auth_state/auth_cubit.dart';
import 'package:otus_food_app/feature/auth/domain/entities/user_entity/user_entity.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key, required this.userEntity}) : super(key: key);

  final UserEntity userEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => context.read<AuthCubit>().getProfile(),
              icon: const Icon(Icons.refresh)),
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => _UserUpdateDialog(),
                );
              },
              icon: const Icon(Icons.edit)),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(screenIdx: 3),
      backgroundColor: const Color(0xFFC2C2C2),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 123,
              width: 123,
              padding: const EdgeInsets.all(13),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xFF165932),
                  width: 4,
                ),
              ),
              child: Image.asset(
                Constants.imageProfile,
                height: 96,
                width: 96,
                fit: BoxFit.fitWidth,
              ),
            ),
            const SizedBox(
              height: 29,
            ),
            Container(
              width: 396.0,
              height: 64.0,
              decoration: const BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Логин',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        fontSize: 16.0,
                        color: Color(0xFF165932),
                      ),
                    ),
                    Text(
                      userEntity.login,
                      style: const TextStyle(
                        fontFamily: 'Roboto',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        fontSize: 16.0,
                        color: Color(0xFF165932),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              width: 396.0,
              height: 64.0,
              decoration: const BoxDecoration(
                color: Color(0xFFFFFFFF),
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              child: Center(
                child: TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(
                      fontFamily: 'Roboto',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                      color: Color(0xFFF54848),
                    ),
                  ),
                  onPressed: () => context.read<AuthCubit>().logOut(),
                  child: const Text('Выход'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _UserUpdateDialog extends StatefulWidget {
  const _UserUpdateDialog({super.key});

  @override
  State<_UserUpdateDialog> createState() => __UserUpdateDialogState();
}

class __UserUpdateDialogState extends State<_UserUpdateDialog> {
  final emailController = TextEditingController();
  final loginController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    loginController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            AppTextField(controller: loginController, labelText: "Логин"),
            const SizedBox(
              height: 16,
            ),
            AppTextField(
                controller: emailController,
                labelText: "email",
                iconName: Constants.iconFridge),
            const SizedBox(
              height: 16,
            ),
            AppTextButton(
                onPressed: () {
                  context.read<AuthCubit>().userUpdate(
                        email: emailController.text,
                        login: loginController.text,
                      );
                },
                text: "Сохранить")
          ],
        ),
      ),
    ]);
  }
}
