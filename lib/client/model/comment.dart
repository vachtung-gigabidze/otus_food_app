part of swagger.api;

class Comment {
  /* This is the primary identifier for this object.  */
  int? id;

  String? text;

  String? photo;

  DateTime? datetime;

  User? user;

  Comment();

  @override
  String toString() {
    return 'Comment[id=$id, text=$text, photo=$photo, datetime=$datetime, user=$user, ]';
  }

  Comment.fromJson(Map<String, dynamic> json) {
    if (json.isEmpty) return;
    id = json['id'];
    text = json['text'];
    photo = json['photo'];
    datetime =
        json['datetime'] == null ? null : DateTime.parse(json['datetime']);
    user = User.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'photo': photo,
      'datetime': datetime == null ? '' : datetime?.toUtc().toIso8601String(),
      'user': user
    };
  }

  static List<Comment> listFromJson(List<dynamic> json) {
    return json.isEmpty
        ? []
        : json.map((value) => Comment.fromJson(value)).toList();
  }

  static Map<String, Comment> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = <String, Comment>{};
    if (json.isNotEmpty) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = Comment.fromJson(value));
    }
    return map;
  }
}
