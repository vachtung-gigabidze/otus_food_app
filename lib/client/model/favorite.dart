part of swagger.api;

class Favorite {
  /* This is the primary identifier for this object.  */
  int? id = null;

  Recipe? recipe = null;

  User? user = null;

  Favorite();

  @override
  String toString() {
    return 'Favorite[id=$id, recipe=$recipe, user=$user, ]';
  }

  Favorite.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    recipe = new Recipe.fromJson(json['recipe']);
    user = new User.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'recipe': recipe, 'user': user};
  }

  static List<Favorite> listFromJson(List<dynamic> json) {
    return json == null
        ? []
        : json.map((value) => new Favorite.fromJson(value)).toList();
  }

  static Map<String, Favorite> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, Favorite>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = new Favorite.fromJson(value));
    }
    return map;
  }
}
