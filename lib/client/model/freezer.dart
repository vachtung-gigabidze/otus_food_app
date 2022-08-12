part of swagger.api;

class Freezer {
  /* This is the primary identifier for this object.  */
  int? id;

  double? count;

  User? user;

  Ingredient? ingredient;

  Freezer();

  @override
  String toString() {
    return 'Freezer[id=$id, count=$count, user=$user, ingredient=$ingredient, ]';
  }

  Freezer.fromJson(Map<String, dynamic> json) {
    if (json.isEmpty) return;
    id = json['id'];
    count = json['count'];
    user = User.fromJson(json['user']);
    ingredient = Ingredient.fromJson(json['ingredient']);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'count': count, 'user': user, 'ingredient': ingredient};
  }

  static List<Freezer> listFromJson(List<dynamic> json) {
    return json.isEmpty
        ? []
        : json.map((value) => Freezer.fromJson(value)).toList();
  }

  static Map<String, Freezer> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = <String, Freezer>{};
    if (json.isNotEmpty) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = Freezer.fromJson(value));
    }
    return map;
  }
}
