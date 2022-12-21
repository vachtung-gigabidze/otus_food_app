// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IdDto _$IdDtoFromJson(Map<String, dynamic> json) => IdDto(
      id: json['id'] as int?,
    );

Map<String, dynamic> _$IdDtoToJson(IdDto instance) => <String, dynamic>{
      'id': instance.id,
    };

FavoriteDto _$FavoriteDtoFromJson(Map<String, dynamic> json) => FavoriteDto(
      recipe: IdDto.fromJson(json['recipe'] as Map<String, dynamic>),
      user: IdDto.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FavoriteDtoToJson(FavoriteDto instance) =>
    <String, dynamic>{
      'recipe': instance.recipe,
      'user': instance.user,
    };
