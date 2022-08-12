part of swagger.api;

class Recipe {
  int? id;

  Recipe();

  @override
  String toString() {
    return 'Recipe[id=$id, ]';
  }

  Recipe.fromJson(Map<String, dynamic> json) {
    if (json.isEmpty) return;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    return {'id': id};
  }

  static List<Recipe> listFromJson(List<dynamic> json) {
    return json.isEmpty
        ? []
        : json.map((value) => Recipe.fromJson(value)).toList();
  }

  static Map<String, Recipe> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = <String, Recipe>{};
    if (json.isNotEmpty) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = Recipe.fromJson(value));
    }
    return map;
  }
}
