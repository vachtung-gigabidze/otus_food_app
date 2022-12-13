import 'package:otus_food_app/feature/recipe_list/domain/entities/recipe_entity.dart';

class Freezer {
  int? id;
  double? count;
  User? user;
  Ingredient? ingredient;

  Freezer({this.id, this.count, this.user, this.ingredient});

  String showQuantity() {
    if (count == 0) {
      return 'по вкусу';
    }

    RegExp regex = RegExp(r'([.]*0)(?!.*\d)');

    String s = count.toString().replaceAll(regex, '');

    if (count! > 4) {
      return '$s ${ingredient?.measureUnit?.many}';
    }
    if (count! == 1) {
      return '$s ${ingredient?.measureUnit?.one}';
    }
    return '$s ${ingredient?.measureUnit?.few}';
  }

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
