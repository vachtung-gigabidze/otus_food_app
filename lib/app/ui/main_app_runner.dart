import 'package:flutter/material.dart';
import 'package:otus_food_app/app/di/init_di.dart';
import 'package:otus_food_app/app/domain/app_builder.dart';
import 'package:otus_food_app/app/domain/app_runner.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class MainAppRunner implements AppRunner {
  final String env;

  const MainAppRunner(this.env);

  @override
  Future<void> preloaderData() async {
    await _requestRelevantRuntimePermissions();
    // init app
    initDi(env);
    // init config
  }

  Future<void> _requestRelevantRuntimePermissions() async {
    if (await Permission.location.serviceStatus.isEnabled) {
      var status = await Permission.location.status;
      if (status.isGranted) {
      } else if (status.isDenied) {
        await [
          Permission.location,
        ].request();

        if (await Permission.location.isPermanentlyDenied) {
          openAppSettings();
        }
      }
    } else {}
  }

  @override
  Future<void> run(AppBuilder appBuilder) async {
    final storage = await HydratedStorage.build(
        storageDirectory: await getApplicationDocumentsDirectory());
    HydratedBlocOverrides.runZoned(
      () async {
        await preloaderData();
        runApp(appBuilder.buildApp());
      },
      storage: storage,
    );
  }
}
