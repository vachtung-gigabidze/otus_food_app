import 'package:otus_food_app/app/domain/app_builder.dart';

abstract class AppRunner {
  Future<void> preloaderData();

  Future<void> run(AppBuilder appBuilder);
}
