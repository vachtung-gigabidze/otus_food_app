part of swagger.api;

class HttpBasicAuth implements Authentication {
  late String? username;
  late String? password;

  @override
  void applyToParams(
      List<QueryParam> queryParams, Map<String, String> headerParams) {
    String str =
        "${username!.isEmpty ? "" : username}:${(password!.isEmpty ? "" : password)}";

    headerParams["Authorization"] = "Basic ${base64.encode(utf8.encode(str))}";
  }
}
