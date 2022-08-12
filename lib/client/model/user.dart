part of swagger.api;

class User {
  int? id;

  User();

  @override
  String toString() {
    return 'User[id=$id, ]';
  }

  User.fromJson(Map<String, dynamic> json) {
    if (json.isEmpty) return;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    return {'id': id};
  }

  static List<User> listFromJson(List<dynamic> json) {
    return json.isEmpty
        ? []
        : json.map((value) => User.fromJson(value)).toList();
  }

  static Map<String, User> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = <String, User>{};
    if (json.isNotEmpty) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = User.fromJson(value));
    }
    return map;
  }
}
