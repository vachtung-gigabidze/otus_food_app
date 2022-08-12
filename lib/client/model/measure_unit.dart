part of swagger.api;

class MeasureUnit {
  int? id;

  MeasureUnit();

  @override
  String toString() {
    return 'MeasureUnit[id=$id, ]';
  }

  MeasureUnit.fromJson(Map<String, dynamic> json) {
    if (json.isEmpty) return;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    return {'id': id};
  }

  static List<MeasureUnit> listFromJson(List<dynamic> json) {
    return json.isEmpty
        ? []
        : json.map((value) => MeasureUnit.fromJson(value)).toList();
  }

  static Map<String, MeasureUnit> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = <String, MeasureUnit>{};
    if (json.isNotEmpty) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = MeasureUnit.fromJson(value));
    }
    return map;
  }
}
