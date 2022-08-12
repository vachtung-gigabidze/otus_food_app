part of swagger.api;

class Step {
  int? id;
  Step();

  @override
  String toString() {
    return 'Step[id=$id, ]';
  }

  Step.fromJson(Map<String, dynamic> json) {
    if (json.isEmpty) return;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    return {'id': id};
  }

  static List<Step> listFromJson(List<dynamic> json) {
    return json.isEmpty
        ? []
        : json.map((value) => Step.fromJson(value)).toList();
  }

  static Map<String, Step> mapFromJson(Map<String, Map<String, dynamic>> json) {
    var map = <String, Step>{};
    if (json.isNotEmpty) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = Step.fromJson(value));
    }
    return map;
  }
}
