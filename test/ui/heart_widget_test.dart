import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:otus_food_app/constants.dart';
import 'package:otus_food_app/feature/recipe_list/ui/components/detail/heart.dart';
import 'package:rive/rive.dart';

Widget _wrap(Widget widget) {
  return MaterialApp(
    home: Scaffold(body: widget),
  );
}

void main() {
  testWidgets("Виджет-тест для переключения избранного", (widgetTester) async {
    bool isFavorite = false;

    void updateFavorite(String id) {
      isFavorite = !isFavorite;
    }

    await widgetTester.pumpWidget(_wrap(HeartWidget(
      animate: isFavorite,
      heatTap: () {
        updateFavorite('1');
      },
    )));

    final image = find.byType(Image);

    expect(image, findsOneWidget);
    expect(
      find.byWidgetPredicate((widget) =>
          widget is Image &&
          widget.image is AssetImage &&
          (widget.image as AssetImage).assetName == Constants.iconHeartBlack),
      findsOneWidget,
    );

    expect(isFavorite, false);

    await widgetTester.tap(find.byType(InkWell), pointer: 1);
    await widgetTester.pumpAndSettle();

    expect(isFavorite, true);

    await widgetTester.pumpWidget(_wrap(HeartWidget(
      animate: isFavorite,
      heatTap: () {
        updateFavorite('1');
      },
    )));

    final river = find.byType(RiveAnimation);

    expect(river, findsOneWidget);
    expect(
      find.byWidgetPredicate((widget) =>
          widget is RiveAnimation && 'assets/animate/heart.riv' == widget.name),
      findsOneWidget,
    );
  });
}
