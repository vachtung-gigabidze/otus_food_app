part of swagger.api;

class InlineResponse400 {
  String? error = null;

  InlineResponse400();

  @override
  String toString() {
    return 'InlineResponse400[error=$error, ]';
  }

  InlineResponse400.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    return {'error': error};
  }

  static List<InlineResponse400> listFromJson(List<dynamic> json) {
    return json == null
        ? []
        : json.map((value) => new InlineResponse400.fromJson(value)).toList();
  }

  static Map<String, InlineResponse400> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = new Map<String, InlineResponse400>();
    if (json != null && json.length > 0) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = new InlineResponse400.fromJson(value));
    }
    return map;
  }
}
