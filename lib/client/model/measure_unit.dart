part of swagger.api;

class MeasureUnit {
  int? id = null;

  MeasureUnit();

  @override
  String toString() {
    return 'MeasureUnit[id=$id, ]';
  }

  MeasureUnit.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    return {'id': id};
  }

  static List<MeasureUnit> listFromJson(List<dynamic> json) {
    return json == null
        ? []
        : json.map((value) => new MeasureUnit.fromJson(value)).toList();
  }

  static Map<String, MeasureUnit> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, MeasureUnit>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = new MeasureUnit.fromJson(value));
    }
    return map;
  }
}
