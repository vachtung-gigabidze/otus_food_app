part of swagger.api;

class MeasureUnitApi {
  final ApiClient apiClient;

  MeasureUnitApi([ApiClient? apiClient])
      : apiClient = apiClient ?? defaultApiClient;

  ///
  ///
  ///
  Future<MeasureUnit> createMeasureUnit(MeasureUnit? body) async {
    Object? postBody = body;

    // verify required params are set
    if (body == null) {
      throw ApiException(400, "Missing required param: body");
    }

    // create path and map variables
    String path = "/measure_unit".replaceAll("{format}", "json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};

    List<String> contentTypes = ["application/json"];

    String contentType =
        contentTypes.isNotEmpty ? contentTypes[0] : "application/json";
    List<String> authNames = [];

    if (contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      MultipartRequest mp = MultipartRequest("", Uri.parse(''));
      if (hasFields) postBody = mp;
    } else {}

    var response = await apiClient.invokeAPI(path, 'POST', queryParams,
        postBody, headerParams, formParams, contentType, authNames);

    if (response.statusCode >= 400) {
      throw ApiException(response.statusCode, response.body);
    } else if (response.body.isNotEmpty) {
      return apiClient.deserialize(response.body, 'MeasureUnit') as MeasureUnit;
    } else {
      return MeasureUnit();
    }
  }

  ///
  ///
  ///
  Future deleteMeasureUnit(String? id) async {
    Object? postBody;

    // verify required params are set
    if (id == null) {
      throw ApiException(400, "Missing required param: id");
    }

    // create path and map variables
    String path = "/measure_unit/{id}"
        .replaceAll("{format}", "json")
        .replaceAll("{id}", id.toString());

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};

    List<String> contentTypes = [];

    String contentType =
        contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = [];

    if (contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      MultipartRequest mp = MultipartRequest("", Uri.parse(''));
      if (hasFields) postBody = mp;
    } else {}

    var response = await apiClient.invokeAPI(path, 'DELETE', queryParams,
        postBody, headerParams, formParams, contentType, authNames);

    if (response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if (response.body != null) {
      return;
    } else {
      return;
    }
  }

  ///
  ///
  ///
  Future<MeasureUnit> getMeasureUnit(String id) async {
    Object? postBody = null;

    // verify required params are set
    if (id == null) {
      throw new ApiException(400, "Missing required param: id");
    }

    // create path and map variables
    String path = "/measure_unit/{id}"
        .replaceAll("{format}", "json")
        .replaceAll("{" + "id" + "}", id.toString());

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};

    List<String> contentTypes = [];

    String contentType =
        contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = [];

    if (contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      MultipartRequest mp = MultipartRequest("", Uri.parse(''));
      if (hasFields) postBody = mp;
    } else {}

    var response = await apiClient.invokeAPI(path, 'GET', queryParams, postBody,
        headerParams, formParams, contentType, authNames);

    if (response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if (response.body != null) {
      return apiClient.deserialize(response.body, 'MeasureUnit') as MeasureUnit;
    } else {
      return MeasureUnit();
    }
  }

  ///
  ///
  ///
  Future<List<MeasureUnit>> getMeasureUnits(
      {int? count,
      int? offset,
      String? pageBy,
      String? pageAfter,
      String? pagePrior,
      List<String>? sortBy}) async {
    Object? postBody = null;

    // verify required params are set

    // create path and map variables
    String path = "/measure_unit".replaceAll("{format}", "json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
    if (count != null) {
      queryParams
          .addAll(_convertParametersForCollectionFormat("", "count", count));
    }
    if (offset != null) {
      queryParams
          .addAll(_convertParametersForCollectionFormat("", "offset", offset));
    }
    if (pageBy != null) {
      queryParams
          .addAll(_convertParametersForCollectionFormat("", "pageBy", pageBy));
    }
    if (pageAfter != null) {
      queryParams.addAll(
          _convertParametersForCollectionFormat("", "pageAfter", pageAfter));
    }
    if (pagePrior != null) {
      queryParams.addAll(
          _convertParametersForCollectionFormat("", "pagePrior", pagePrior));
    }
    if (sortBy != null) {
      queryParams.addAll(
          _convertParametersForCollectionFormat("multi", "sortBy", sortBy));
    }

    List<String> contentTypes = [];

    String contentType =
        contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = [];

    if (contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      MultipartRequest mp = MultipartRequest("", Uri.parse(''));
      if (hasFields) postBody = mp;
    } else {}

    var response = await apiClient.invokeAPI(path, 'GET', queryParams, postBody,
        headerParams, formParams, contentType, authNames);

    if (response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if (response.body != null) {
      return (apiClient.deserialize(response.body, 'List<MeasureUnit>') as List)
          .map((item) => item as MeasureUnit)
          .toList();
    } else {
      return [];
    }
  }

  ///
  ///
  ///
  Future<MeasureUnit> updateMeasureUnit(MeasureUnit body, String id) async {
    Object postBody = body;

    // verify required params are set
    if (body == null) {
      throw new ApiException(400, "Missing required param: body");
    }
    if (id == null) {
      throw new ApiException(400, "Missing required param: id");
    }

    // create path and map variables
    String path = "/measure_unit/{id}"
        .replaceAll("{format}", "json")
        .replaceAll("{" + "id" + "}", id.toString());

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};

    List<String> contentTypes = ["application/json"];

    String contentType =
        contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = [];

    if (contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      MultipartRequest mp = MultipartRequest("", Uri.parse(''));
      if (hasFields) postBody = mp;
    } else {}

    var response = await apiClient.invokeAPI(path, 'PUT', queryParams, postBody,
        headerParams, formParams, contentType, authNames);

    if (response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if (response.body != null) {
      return apiClient.deserialize(response.body, 'MeasureUnit') as MeasureUnit;
    } else {
      return MeasureUnit();
    }
  }
}
