import 'package:otus_food_app/feature/auth/domain/entities/user_entity/user_entity.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key, required this.userEntity});

  final UserEntity userEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MainScreen')),
      body: Center(
        child: Text(userEntity.login),
      ),
    );
  }
}
