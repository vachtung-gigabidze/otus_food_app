import 'package:flutter/cupertino.dart';
import 'package:otus_food_app/app/ui/main_app_builder.dart';
import 'package:otus_food_app/app/ui/main_app_runner.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  const env = String.fromEnvironment("env", defaultValue: "prod");
  const runner = MainAppRunner(env);
  final builder = MainAppBuilder();

  runner.run(builder);
}
