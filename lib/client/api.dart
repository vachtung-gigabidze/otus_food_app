library swagger.api;

import 'dart:async';
import 'dart:convert';
import 'dart:html';
import 'package:http/browser_client.dart';
import 'package:http/http.dart';

part 'api_client.dart';
part 'api_helper.dart';
part 'api_exception.dart';
part 'auth/authentication.dart';
part 'auth/api_key_auth.dart';
part 'auth/oauth.dart';
part 'auth/http_basic_auth.dart';

part 'api/comment_api.dart';
part 'api/favorite_api.dart';
part 'api/freezer_api.dart';
part 'api/ingredient_api.dart';
part 'api/measure_unit_api.dart';
part 'api/recipe_api.dart';
part 'api/user_api.dart';
part 'model/comment.dart';
part 'model/error.dart';
part 'model/favorite.dart';
part 'model/freezer.dart';
part 'model/ingredient.dart';
part 'model/inline_response400.dart';
part 'model/measure_unit.dart';
part 'model/recipe.dart';
part 'model/recipe_ingredient.dart';
part 'model/recipe_step.dart';
part 'model/recipe_step_link.dart';
part 'model/status.dart';
part 'model/step.dart';
part 'model/user.dart';

ApiClient defaultApiClient = ApiClient();
