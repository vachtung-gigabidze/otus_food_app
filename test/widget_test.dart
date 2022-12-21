// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';

// import 'package:otus_food_app/main.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:otus_food_app/feature/favorite/data/dto/favorite_dto.dart';
import 'package:otus_food_app/feature/recipe_list/domain/entities/recipe_entity.dart';

void main() {
  test('Correct FavoriteDto json', () {
    final Favorite favorite =
        Favorite(id: 1, recipe: Recipe(id: 1), user: User(id: 1));

    final dto = FavoriteDto(
            recipe: IdDto(id: favorite.recipe?.id),
            user: IdDto(id: favorite.user?.id))
        .toJson();

    expect(dto.toString(), "{recipe: {id: 1}, user: {id: 1}}");
  });

  // testWidgets('Counter increments smoke test', (WidgetTester tester) async {
  //   // Build our app and trigger a frame.
  //   await tester.pumpWidget(MyApp());

  //   // Verify that our counter starts at 0.
  //   expect(find.text('0'), findsOneWidget);
  //   expect(find.text('1'), findsNothing);

  //   // Tap the '+' icon and trigger a frame.
  //   await tester.tap(find.byIcon(Icons.add));
  //   await tester.pump();

  //   // Verify that our counter has incremented.
  //   expect(find.text('0'), findsNothing);
  //   expect(find.text('1'), findsOneWidget);
  // });
}
