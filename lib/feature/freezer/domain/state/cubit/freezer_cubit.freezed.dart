// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'freezer_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FreezerState _$FreezerStateFromJson(Map<String, dynamic> json) {
  return _FreezerState.fromJson(json);
}

/// @nodoc
mixin _$FreezerState {
  @JsonKey(ignore: true)
  AsyncSnapshot<dynamic>? get asyncSnapshot =>
      throw _privateConstructorUsedError;
  List<Freezer> get freezerList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FreezerStateCopyWith<FreezerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FreezerStateCopyWith<$Res> {
  factory $FreezerStateCopyWith(
          FreezerState value, $Res Function(FreezerState) then) =
      _$FreezerStateCopyWithImpl<$Res, FreezerState>;
  @useResult
  $Res call(
      {@JsonKey(ignore: true) AsyncSnapshot<dynamic>? asyncSnapshot,
      List<Freezer> freezerList});
}

/// @nodoc
class _$FreezerStateCopyWithImpl<$Res, $Val extends FreezerState>
    implements $FreezerStateCopyWith<$Res> {
  _$FreezerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? asyncSnapshot = freezed,
    Object? freezerList = null,
  }) {
    return _then(_value.copyWith(
      asyncSnapshot: freezed == asyncSnapshot
          ? _value.asyncSnapshot
          : asyncSnapshot // ignore: cast_nullable_to_non_nullable
              as AsyncSnapshot<dynamic>?,
      freezerList: null == freezerList
          ? _value.freezerList
          : freezerList // ignore: cast_nullable_to_non_nullable
              as List<Freezer>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FreezerStateCopyWith<$Res>
    implements $FreezerStateCopyWith<$Res> {
  factory _$$_FreezerStateCopyWith(
          _$_FreezerState value, $Res Function(_$_FreezerState) then) =
      __$$_FreezerStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(ignore: true) AsyncSnapshot<dynamic>? asyncSnapshot,
      List<Freezer> freezerList});
}

/// @nodoc
class __$$_FreezerStateCopyWithImpl<$Res>
    extends _$FreezerStateCopyWithImpl<$Res, _$_FreezerState>
    implements _$$_FreezerStateCopyWith<$Res> {
  __$$_FreezerStateCopyWithImpl(
      _$_FreezerState _value, $Res Function(_$_FreezerState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? asyncSnapshot = freezed,
    Object? freezerList = null,
  }) {
    return _then(_$_FreezerState(
      asyncSnapshot: freezed == asyncSnapshot
          ? _value.asyncSnapshot
          : asyncSnapshot // ignore: cast_nullable_to_non_nullable
              as AsyncSnapshot<dynamic>?,
      freezerList: null == freezerList
          ? _value._freezerList
          : freezerList // ignore: cast_nullable_to_non_nullable
              as List<Freezer>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FreezerState extends _FreezerState {
  const _$_FreezerState(
      {@JsonKey(ignore: true) this.asyncSnapshot,
      final List<Freezer> freezerList = const []})
      : _freezerList = freezerList,
        super._();

  factory _$_FreezerState.fromJson(Map<String, dynamic> json) =>
      _$$_FreezerStateFromJson(json);

  @override
  @JsonKey(ignore: true)
  final AsyncSnapshot<dynamic>? asyncSnapshot;
  final List<Freezer> _freezerList;
  @override
  @JsonKey()
  List<Freezer> get freezerList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_freezerList);
  }

  @override
  String toString() {
    return 'FreezerState(asyncSnapshot: $asyncSnapshot, freezerList: $freezerList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FreezerState &&
            (identical(other.asyncSnapshot, asyncSnapshot) ||
                other.asyncSnapshot == asyncSnapshot) &&
            const DeepCollectionEquality()
                .equals(other._freezerList, _freezerList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, asyncSnapshot,
      const DeepCollectionEquality().hash(_freezerList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FreezerStateCopyWith<_$_FreezerState> get copyWith =>
      __$$_FreezerStateCopyWithImpl<_$_FreezerState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FreezerStateToJson(
      this,
    );
  }
}

abstract class _FreezerState extends FreezerState {
  const factory _FreezerState(
      {@JsonKey(ignore: true) final AsyncSnapshot<dynamic>? asyncSnapshot,
      final List<Freezer> freezerList}) = _$_FreezerState;
  const _FreezerState._() : super._();

  factory _FreezerState.fromJson(Map<String, dynamic> json) =
      _$_FreezerState.fromJson;

  @override
  @JsonKey(ignore: true)
  AsyncSnapshot<dynamic>? get asyncSnapshot;
  @override
  List<Freezer> get freezerList;
  @override
  @JsonKey(ignore: true)
  _$$_FreezerStateCopyWith<_$_FreezerState> get copyWith =>
      throw _privateConstructorUsedError;
}
