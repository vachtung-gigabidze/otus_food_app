part of swagger.api;

class Step {
  int? id = null;

  Step();

  @override
  String toString() {
    return 'Step[id=$id, ]';
  }

  Step.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    return {'id': id};
  }

  static List<Step> listFromJson(List<dynamic> json) {
    return json == null
        ? []
        : json.map((value) => new Step.fromJson(value)).toList();
  }

  static Map<String, Step> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, Step>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = new Step.fromJson(value));
    }
    return map;
  }
}
