part of swagger.api;

class RecipeStep {
  /* This is the primary identifier for this object.  */
  int? id;
  String? name;

  int? duration;

  List<RecipeStepLink> recipeStepLinks = [];

  RecipeStep();

  @override
  String toString() {
    return 'RecipeStep[id=$id, name=$name, duration=$duration, recipeStepLinks=$recipeStepLinks, ]';
  }

  RecipeStep.fromJson(Map<String, dynamic> json) {
    if (json.isEmpty) return;
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
    return json.isEmpty
        ? []
        : json.map((value) => RecipeStep.fromJson(value)).toList();
  }

  static Map<String, RecipeStep> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = <String, RecipeStep>{};
    if (json.isNotEmpty) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = RecipeStep.fromJson(value));
    }
    return map;
  }
}
