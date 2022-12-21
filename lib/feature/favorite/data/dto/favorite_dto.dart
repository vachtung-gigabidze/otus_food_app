import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite_dto.g.dart';

@JsonSerializable()
class IdDto {
  int? id;

  IdDto({this.id});

  factory IdDto.fromJson(Map<String, dynamic> json) => _$IdDtoFromJson(json);

  Map<String, dynamic> toJson() => _$IdDtoToJson(this);
}

@JsonSerializable()
class FavoriteDto {
  final IdDto recipe;
  final IdDto user;

  FavoriteDto({
    required this.recipe,
    required this.user,
  });

  factory FavoriteDto.fromJson(Map<String, dynamic> json) =>
      _$FavoriteDtoFromJson(json);

  Map<String, dynamic> toJson() => _$FavoriteDtoToJson(this);
}
