part of swagger.api;

class RecipeIngredient {
  /* This is the primary identifier for this object.  */
  int? id;

  int? count;

  Ingredient? ingredient;

  Recipe? recipe;

  RecipeIngredient();

  @override
  String toString() {
    return 'RecipeIngredient[id=$id, count=$count, ingredient=$ingredient, recipe=$recipe, ]';
  }

  RecipeIngredient.fromJson(Map<String, dynamic> json) {
    if (json.isEmpty) return;
    id = json['id'];
    count = json['count'];
    ingredient = Ingredient.fromJson(json['ingredient']);
    recipe = Recipe.fromJson(json['recipe']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'count': count,
      'ingredient': ingredient,
      'recipe': recipe
    };
  }

  static List<RecipeIngredient> listFromJson(List<dynamic> json) {
    return json.isEmpty
        ? []
        : json.map((value) => RecipeIngredient.fromJson(value)).toList();
  }

  static Map<String, RecipeIngredient> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = <String, RecipeIngredient>{};
    if (json.isNotEmpty) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = RecipeIngredient.fromJson(value));
    }
    return map;
  }
}
