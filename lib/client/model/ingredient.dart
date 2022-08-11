part of swagger.api;

class Ingredient {
  int? id = null;

  Ingredient();

  @override
  String toString() {
    return 'Ingredient[id=$id, ]';
  }

  Ingredient.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    return {'id': id};
  }

  static List<Ingredient> listFromJson(List<dynamic> json) {
    return json == null
        ? []
        : json.map((value) => new Ingredient.fromJson(value)).toList();
  }

  static Map<String, Ingredient> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, Ingredient>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = new Ingredient.fromJson(value));
    }
    return map;
  }
}
