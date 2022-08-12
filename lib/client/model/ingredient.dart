part of swagger.api;

class Ingredient {
  int? id;

  Ingredient();

  @override
  String toString() {
    return 'Ingredient[id=$id, ]';
  }

  Ingredient.fromJson(Map<String, dynamic> json) {
    if (json.isEmpty) return;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    return {'id': id};
  }

  static List<Ingredient> listFromJson(List<dynamic> json) {
    return json.isEmpty
        ? []
        : json.map((value) => Ingredient.fromJson(value)).toList();
  }

  static Map<String, Ingredient> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = <String, Ingredient>{};
    if (json.isNotEmpty) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = Ingredient.fromJson(value));
    }
    return map;
  }
}
