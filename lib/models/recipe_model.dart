import 'package:otus_food_app/feature/recipe_list/domain/entities/recipe_entity.dart';

//TODO: перенести в feature Freezer
class Freezer {
  int? id;
  int? count;
  User? user;
  Ingredient? ingredient;

  Freezer({this.id, this.count, this.user, this.ingredient});

  Freezer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    count = json['count'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    ingredient = json['ingredient'] != null
        ? Ingredient.fromJson(json['ingredient'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['count'] = count;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (ingredient != null) {
      data['ingredient'] = ingredient!.toJson();
    }
    return data;
  }
}
