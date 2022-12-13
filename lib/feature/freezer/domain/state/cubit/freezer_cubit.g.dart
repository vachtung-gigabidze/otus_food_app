// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'freezer_cubit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FreezerState _$$_FreezerStateFromJson(Map<String, dynamic> json) =>
    _$_FreezerState(
      freezerList: (json['freezerList'] as List<dynamic>?)
              ?.map((e) => Freezer.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_FreezerStateToJson(_$_FreezerState instance) =>
    <String, dynamic>{
      'freezerList': instance.freezerList,
    };
