import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
// import 'package:integration_test/integration_test.dart';
import 'package:otus_food_app/app/ui/main_app_builder.dart';
import 'package:otus_food_app/app/ui/main_app_runner.dart';

void main() {
  //IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Отображение всех виджетов на странице описания рецепта', () {
    setUp(() {
      const env = String.fromEnvironment("env", defaultValue: "prod");
      const runner = MainAppRunner(env);
      final builder = MainAppBuilder();
      runner.run(builder);
    });
    testWidgets('cooking step ', (widgetTester) async {
      await Future.delayed(const Duration(seconds: 5));

      final button = find.byType(InkWell);

      await widgetTester.tap(button, pointer: 1);

      await widgetTester.pumpAndSettle();

      // Verify the counter starts at 0.
      // expect(find.text('0'), findsOneWidget);

      // // Finds the floating action button to tap on.
      // final Finder fab = find.byTooltip('Increment');

      // // Emulate a tap on the floating action button.
      // await tester.tap(fab);

      // // Trigger a frame.
      // await tester.pumpAndSettle();

      // // Verify the counter increments by 1.
      // expect(find.text('1'), findsOneWidget);
    });
  });
}
