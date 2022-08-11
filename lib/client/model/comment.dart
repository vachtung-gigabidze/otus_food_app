part of swagger.api;

class Comment {
  /* This is the primary identifier for this object.  */
  int? id = null;

  String? text = null;

  String? photo = null;

  DateTime? datetime = null;

  User? user = null;

  Comment();

  @override
  String toString() {
    return 'Comment[id=$id, text=$text, photo=$photo, datetime=$datetime, user=$user, ]';
  }

  Comment.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    text = json['text'];
    photo = json['photo'];
    datetime =
        json['datetime'] == null ? null : DateTime.parse(json['datetime']);
    user = new User.fromJson(json['user']);
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
    return json == null
        ? []
        : json.map((value) => new Comment.fromJson(value)).toList();
  }

  static Map<String, Comment> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, Comment>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = new Comment.fromJson(value));
    }
    return map;
  }
}
