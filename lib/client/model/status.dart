part of swagger.api;

class Status {
  String? status = null;

  Status();

  @override
  String toString() {
    return 'Status[status=$status, ]';
  }

  Status.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    return {'status': status};
  }

  static List<Status> listFromJson(List<dynamic> json) {
    return json == null
        ? []
        : json.map((value) => new Status.fromJson(value)).toList();
  }

  static Map<String, Status> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, Status>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = new Status.fromJson(value));
    }
    return map;
  }
}
