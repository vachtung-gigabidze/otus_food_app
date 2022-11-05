// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_list_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RecipeListStateEmpty _$$_RecipeListStateEmptyFromJson(
        Map<String, dynamic> json) =>
    _$_RecipeListStateEmpty(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_RecipeListStateEmptyToJson(
        _$_RecipeListStateEmpty instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$_RecipeListStateLoaded _$$_RecipeListStateLoadedFromJson(
        Map<String, dynamic> json) =>
    _$_RecipeListStateLoaded(
      (json['recipeList'] as List<dynamic>)
          .map((e) => Recipe.fromJson(e as Map<String, dynamic>))
          .toList(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_RecipeListStateLoadedToJson(
        _$_RecipeListStateLoaded instance) =>
    <String, dynamic>{
      'recipeList': instance.recipeList,
      'runtimeType': instance.$type,
    };

_$_RecipeListStateWaiting _$$_RecipeListStateWaitingFromJson(
        Map<String, dynamic> json) =>
    _$_RecipeListStateWaiting(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_RecipeListStateWaitingToJson(
        _$_RecipeListStateWaiting instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$_RecipeListStateError _$$_RecipeListStateErrorFromJson(
        Map<String, dynamic> json) =>
    _$_RecipeListStateError(
      json['error'],
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_RecipeListStateErrorToJson(
        _$_RecipeListStateError instance) =>
    <String, dynamic>{
      'error': instance.error,
      'runtimeType': instance.$type,
    };
