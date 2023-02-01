import 'package:flutter_test/flutter_test.dart';
import 'package:otus_food_app/feature/favorite/data/dto/favorite_dto.dart';
import 'package:otus_food_app/feature/recipe_list/domain/entities/recipe_entity.dart';

void main() {
  test('Проверка преобразования FavoriteDto в строку для отправки на сервер',
      () {
    final Favorite favorite =
        Favorite(id: 1, recipe: Recipe(id: 1), user: User(id: 1));

    final dto = FavoriteDto(
        recipe: IdDto(id: favorite.recipe?.id),
        user: IdDto(id: favorite.user?.id));

    expect(dto.toString(), "{\"recipe\": {\"id\": 1}, \"user\": {\"id\": 1}}");
  });
}
