import 'package:flutter/cupertino.dart';
import 'package:otus_food_app/app/di/init_di.dart';
import 'package:otus_food_app/app/domain/app_builder.dart';
import 'package:otus_food_app/app/domain/app_runner.dart';

class MainAppRunner implements AppRunner {
  final String env;

  const MainAppRunner(this.env);

  @override
  Future<void> preloaderData() async {
    WidgetsFlutterBinding.ensureInitialized();
    // init app
    initDi(env);
    // init config
  }

  @override
  Future<void> run(AppBuilder appBuilder) async {
    await preloaderData();
    runApp(appBuilder.buildApp());
  }
}
