part of swagger.api;

class Favorite {
  /* This is the primary identifier for this object.  */
  int? id;

  Recipe? recipe;

  User? user;

  Favorite();

  @override
  String toString() {
    return 'Favorite[id=$id, recipe=$recipe, user=$user, ]';
  }

  Favorite.fromJson(Map<String, dynamic> json) {
    if (json.isEmpty) return;
    id = json['id'];
    recipe = Recipe.fromJson(json['recipe']);
    user = User.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'recipe': recipe, 'user': user};
  }

  static List<Favorite> listFromJson(List<dynamic> json) {
    return json.isEmpty
        ? []
        : json.map((value) => Favorite.fromJson(value)).toList();
  }

  static Map<String, Favorite> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = <String, Favorite>{};
    if (json.isNotEmpty) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = Favorite.fromJson(value));
    }
    return map;
  }
}
