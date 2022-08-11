part of swagger.api;

class User {
  int? id = null;

  User();

  @override
  String toString() {
    return 'User[id=$id, ]';
  }

  User.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    return {'id': id};
  }

  static List<User> listFromJson(List<dynamic> json) {
    return json == null
        ? []
        : json.map((value) => new User.fromJson(value)).toList();
  }

  static Map<String, User> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, User>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = new User.fromJson(value));
    }
    return map;
  }
}
