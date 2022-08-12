part of swagger.api;

class Status {
  String? status;

  Status();

  @override
  String toString() {
    return 'Status[status=$status, ]';
  }

  Status.fromJson(Map<String, dynamic> json) {
    if (json.isEmpty) return;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    return {'status': status};
  }

  static List<Status> listFromJson(List<dynamic> json) {
    return json.isEmpty
        ? []
        : json.map((value) => Status.fromJson(value)).toList();
  }

  static Map<String, Status> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = <String, Status>{};
    if (json.isNotEmpty) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = Status.fromJson(value));
    }
    return map;
  }
}
