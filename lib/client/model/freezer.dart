part of swagger.api;

class Freezer {
  /* This is the primary identifier for this object.  */
  int? id = null;

  double? count = null;

  User? user = null;

  Ingredient? ingredient = null;

  Freezer();

  @override
  String toString() {
    return 'Freezer[id=$id, count=$count, user=$user, ingredient=$ingredient, ]';
  }

  Freezer.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    count = json['count'];
    user = new User.fromJson(json['user']);
    ingredient = new Ingredient.fromJson(json['ingredient']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'count': count, 'user': user, 'ingredient': ingredient};
  }

  static List<Freezer> listFromJson(List<dynamic> json) {
    return json == null
        ? []
        : json.map((value) => new Freezer.fromJson(value)).toList();
  }

  static Map<String, Freezer> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, Freezer>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = new Freezer.fromJson(value));
    }
    return map;
  }
}
