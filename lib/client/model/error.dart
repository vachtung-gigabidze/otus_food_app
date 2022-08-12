part of swagger.api;

class Error {
  String? error;

  Error();

  @override
  String toString() {
    return 'Error[error=$error, ]';
  }

  Error.fromJson(Map<String, dynamic> json) {
    if (json.isEmpty) return;
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    return {'error': error};
  }

  static List<Error> listFromJson(List<dynamic> json) {
    return json.isEmpty
        ? []
        : json.map((value) => Error.fromJson(value)).toList();
  }

  static Map<String, Error> mapFromJson(
      Map<String, Map<String, dynamic>> json) {
    var map = <String, Error>{};
    if (json.isNotEmpty) {
      json.forEach((String key, Map<String, dynamic> value) =>
          map[key] = Error.fromJson(value));
    }
    return map;
  }
}
