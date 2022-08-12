part of swagger.api;

class InlineResponse400 {
  String? error;

  InlineResponse400();

  @override
  String toString() {
    return 'InlineResponse400[error=$error, ]';
  }

  InlineResponse400.fromJson(Map<String, dynamic> json) {
    if (json.isEmpty) return;
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    return {'error': error};
  }

  static List<InlineResponse400> listFromJson(List<dynamic> json) {
    return json.isEmpty
        ? []
        : json.map((value) => InlineResponse400.fromJson(value)).toList();
  }

  static Map<String, InlineResponse400> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = <String, InlineResponse400>{};
    if (json.isNotEmpty) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = InlineResponse400.fromJson(value));
    }
    return map;
  }
}
