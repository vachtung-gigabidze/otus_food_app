part of swagger.api;

class RecipeIngredient {
  /* This is the primary identifier for this object.  */
  int? id = null;

  int? count = null;

  Ingredient? ingredient = null;

  Recipe? recipe = null;

  RecipeIngredient();

  @override
  String toString() {
    return 'RecipeIngredient[id=$id, count=$count, ingredient=$ingredient, recipe=$recipe, ]';
  }

  RecipeIngredient.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    count = json['count'];
    ingredient = new Ingredient.fromJson(json['ingredient']);
    recipe = new Recipe.fromJson(json['recipe']);
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
    return json == null
        ? []
        : json.map((value) => new RecipeIngredient.fromJson(value)).toList();
  }

  static Map<String, RecipeIngredient> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, RecipeIngredient>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = new RecipeIngredient.fromJson(value));
    }
    return map;
  }
}
