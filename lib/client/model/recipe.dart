part of swagger.api;

class Recipe {
  int? id = null;

  Recipe();

  @override
  String toString() {
    return 'Recipe[id=$id, ]';
  }

  Recipe.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    return {'id': id};
  }

  static List<Recipe> listFromJson(List<dynamic> json) {
    return json == null
        ? []
        : json.map((value) => new Recipe.fromJson(value)).toList();
  }

  static Map<String, Recipe> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, Recipe>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = new Recipe.fromJson(value));
    }
    return map;
  }
}
