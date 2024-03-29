import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:otus_food_app/feature/recipe_list/domain/entities/recipe_entity.dart';
import 'package:otus_food_app/feature/recipe_list/ui/components/detail/cooking_step.dart';

void main() {
  late Recipe mockRecipe;
  const Key key = Key("testKey");

  Widget wrap(Widget widget) {
    return MaterialApp(
      home: Scaffold(body: widget),
    );
  }

  setUpAll(() {
    mockRecipe = Recipe.fromJson(json.decode(
        '{"id":1,"name":"Лосось в соусе терияки","duration":2700,"photo":"https://cdn.lifehacker.ru/wp-content/uploads/2020/06/shutterstock_1674157888-1_1591696887.jpg","recipeIngredients":[{"id":1,"count":8,"recipe":{"id":1},"ingredient":{"id":1,"name":"Соевый соус","caloriesForUnit":10.600000381469727,"measureUnit":{"id":1,"one":"ст. ложка","few":"ст. ложки","many":"ст. ложек"}}},{"id":2,"count":2,"recipe":{"id":1},"ingredient":{"id":2,"name":"Вода","caloriesForUnit":0.0,"measureUnit":{"id":1,"one":"ст. ложка","few":"ст. ложки","many":"ст. ложек"}}},{"id":3,"count":3,"recipe":{"id":1},"ingredient":{"id":3,"name":"Мёд","caloriesForUnit":0.0,"measureUnit":{"id":1,"one":"ст. ложка","few":"ст. ложки","many":"ст. ложек"}}},{"id":4,"count":2,"recipe":{"id":1},"ingredient":{"id":4,"name":"Коричневый сахар","caloriesForUnit":76.0,"measureUnit":{"id":1,"one":"ст. ложка","few":"ст. ложки","many":"ст. ложек"}}},{"id":5,"count":3,"recipe":{"id":1},"ingredient":{"id":5,"name":"Чеснок","caloriesForUnit":0.0,"measureUnit":{"id":2,"one":"зубчик","few":"зубчика","many":"зубчиков"}}},{"id":6,"count":2,"recipe":{"id":1},"ingredient":{"id":6,"name":"Тёртый свежий имбирь","caloriesForUnit":0.0,"measureUnit":{"id":1,"one":"ст. ложка","few":"ст. ложки","many":"ст. ложек"}}},{"id":7,"count":1,"recipe":{"id":1},"ingredient":{"id":7,"name":"Лимонный сок","caloriesForUnit":3.200000047683716,"measureUnit":{"id":1,"one":"ст. ложка","few":"ст. ложки","many":"ст. ложек"}}},{"id":8,"count":1,"recipe":{"id":1},"ingredient":{"id":8,"name":"Кукурузный крахмал","caloriesForUnit":0.0,"measureUnit":{"id":1,"one":"ст. ложка","few":"ст. ложки","many":"ст. ложек"}}},{"id":9,"count":1,"recipe":{"id":1},"ingredient":{"id":9,"name":"Растительное масло","caloriesForUnit":0.0,"measureUnit":{"id":3,"one":"ч. ложка","few":"ч. ложки","many":"ч. ложек"}}},{"id":10,"count":680,"recipe":{"id":1},"ingredient":{"id":10,"name":"Филе лосося или сёмги","caloriesForUnit":1.7000000476837158,"measureUnit":{"id":4,"one":"г","few":"г","many":"г"}}},{"id":11,"count":0,"recipe":{"id":1},"ingredient":{"id":11,"name":"Кунжут","caloriesForUnit":28.25,"measureUnit":{"id":4,"one":"г","few":"г","many":"г"}}}],"recipeStepLinks":[{"id":1,"number":1,"recipe":{"id":1},"step":{"id":1,"name":"В маленькой кастрюле соедините соевый соус, 6 столовых ложек воды, мёд, сахар, измельчённый чеснок, имбирь и лимонный сок.","duration":360}},{"id":2,"number":2,"recipe":{"id":1},"step":{"id":2,"name":"Поставьте на средний огонь и, помешивая, доведите до лёгкого кипения.","duration":420}},{"id":3,"number":3,"recipe":{"id":1},"step":{"id":3,"name":"Смешайте оставшуюся воду с крахмалом. Добавьте в кастрюлю и перемешайте.","duration":360}}],"favoriteRecipes":[{"id":28,"recipe":{"id":1},"user":{"id":3}},{"id":33,"recipe":{"id":1},"user":{"id":14}},{"id":35,"recipe":{"id":1},"user":{"id":21}}],"comments":[{"id":1,"text":"Я не большой любитель рыбы, но решила приготовить по этому рецепту и просто влюбилась!","photo":"assets/images/comment_image_1.png","datetime":"2022-05-22T05:06:44.434Z","recipe":{"id":1},"user":{"id":3,"username":"dima","avatar":null}},{"id":2,"text":"Я думаю, что если я — это то, что я ем, то мусор я есть не буду! Папа считал, что: «еда — это бензин. Будешь привередничать, не заправишь бак — мотор сдохнет. Так что заткнись и жри!»","photo":"assets/images/comment_image_1.png","datetime":"2022-06-22T05:06:44.434Z","recipe":{"id":1},"user":{"id":2,"username":"dime","avatar":null}}]}'));
  });
  group("Виджет-тест для шагов приготовления рецепта", () {
    testWidgets("Проверка блокировки смены статуса шага приготовления",
        (widgetTester) async {
      final RecipeStepLink stubRecipeStepLink = mockRecipe.recipeStepLinks![0];

      stubRecipeStepLink.status = CookingStepsStatus.notStarted;

      await widgetTester.pumpWidget(wrap(CookingStepCard(
        key: key,
        cookingStepLink: stubRecipeStepLink,
      )));

      final button = find.byType(InkWell);

      expect(button, findsOneWidget);

      final cookingStepCard = find.byKey(key);

      expect(cookingStepCard, findsOneWidget);

      final StatefulElement cookingStepCardElement =
          widgetTester.element(find.byKey(key));

      final CookingStepCardState cookingStepCardElementState =
          cookingStepCardElement.state as CookingStepCardState;

      expect(cookingStepCardElementState.cookingStepLink!.status,
          equals(CookingStepsStatus.notStarted));

      await widgetTester.tap(button, pointer: 1);
      await widgetTester.pumpAndSettle();
      expect(cookingStepCardElementState.cookingStepLink!.status,
          equals(CookingStepsStatus.notStarted));
    });

    testWidgets("Проверка смены статуса для шага приготовления",
        (widgetTester) async {
      final RecipeStepLink stubRecipeStepLink = mockRecipe.recipeStepLinks![0];

      stubRecipeStepLink.status = CookingStepsStatus.notPassed;

      await widgetTester.pumpWidget(wrap(CookingStepCard(
        key: key,
        cookingStepLink: stubRecipeStepLink,
      )));

      final button = find.byType(InkWell);

      expect(button, findsOneWidget);

      final cookingStepCard = find.byKey(key);

      expect(cookingStepCard, findsOneWidget);

      final StatefulElement cookingStepCardElement =
          widgetTester.element(find.byKey(key));

      final CookingStepCardState cookingStepCardElementState =
          cookingStepCardElement.state as CookingStepCardState;

      expect(cookingStepCardElementState.cookingStepLink!.status,
          equals(CookingStepsStatus.notPassed));

      await widgetTester.tap(button, pointer: 1);
      await widgetTester.pumpAndSettle();
      expect(cookingStepCardElementState.cookingStepLink!.status,
          equals(CookingStepsStatus.passed));

      await widgetTester.tap(button, pointer: 1);
      await widgetTester.pumpAndSettle();
      expect(cookingStepCardElementState.cookingStepLink!.status,
          equals(CookingStepsStatus.notPassed));
    });
  });
}
