part of swagger.api;

class RecipeStepLink {
  /* This is the primary identifier for this object.  */
  int? id;

  int? number;

  Recipe? recipe;

  Step? step;

  RecipeStepLink();

  @override
  String toString() {
    return 'RecipeStepLink[id=$id, number=$number, recipe=$recipe, step=$step, ]';
  }

  RecipeStepLink.fromJson(Map<String, dynamic> json) {
    if (json.isEmpty) return;
    id = json['id'];
    number = json['number'];
    recipe = Recipe.fromJson(json['recipe']);
    step = Step.fromJson(json['step']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'number': number, 'recipe': recipe, 'step': step};
  }

  static List<RecipeStepLink> listFromJson(List<dynamic> json) {
    return json.isEmpty
        ? []
        : json.map((value) => RecipeStepLink.fromJson(value)).toList();
  }

  static Map<String, RecipeStepLink> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = <String, RecipeStepLink>{};
    if (json.isEmpty) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = RecipeStepLink.fromJson(value));
    }
    return map;
  }
}
