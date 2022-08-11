part of swagger.api;

class RecipeStep {
  /* This is the primary identifier for this object.  */
  int? id = null;

  String? name = null;

  int? duration = null;

  List<RecipeStepLink> recipeStepLinks = [];

  RecipeStep();

  @override
  String toString() {
    return 'RecipeStep[id=$id, name=$name, duration=$duration, recipeStepLinks=$recipeStepLinks, ]';
  }

  RecipeStep.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    name = json['name'];
    duration = json['duration'];
    recipeStepLinks = RecipeStepLink.listFromJson(json['recipeStepLinks']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'duration': duration,
      'recipeStepLinks': recipeStepLinks
    };
  }

  static List<RecipeStep> listFromJson(List<dynamic> json) {
    return json == null
        ? []
        : json.map((value) => new RecipeStep.fromJson(value)).toList();
  }

  static Map<String, RecipeStep> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, RecipeStep>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = new RecipeStep.fromJson(value));
    }
    return map;
  }
}
