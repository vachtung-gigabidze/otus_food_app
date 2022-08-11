part of swagger.api;

class RecipeStepLink {
  /* This is the primary identifier for this object.  */
  int? id = null;

  int? number = null;

  Recipe? recipe = null;

  Step? step = null;

  RecipeStepLink();

  @override
  String toString() {
    return 'RecipeStepLink[id=$id, number=$number, recipe=$recipe, step=$step, ]';
  }

  RecipeStepLink.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    number = json['number'];
    recipe = new Recipe.fromJson(json['recipe']);
    step = new Step.fromJson(json['step']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'number': number, 'recipe': recipe, 'step': step};
  }

  static List<RecipeStepLink> listFromJson(List<dynamic> json) {
    return json == null
        ? []
        : json.map((value) => new RecipeStepLink.fromJson(value)).toList();
  }

  static Map<String, RecipeStepLink> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, RecipeStepLink>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = new RecipeStepLink.fromJson(value));
    }
    return map;
  }
}
