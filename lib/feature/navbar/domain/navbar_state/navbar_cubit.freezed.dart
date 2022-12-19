// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'navbar_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NavBarState _$NavBarStateFromJson(Map<String, dynamic> json) {
  return _NavBarState.fromJson(json);
}

/// @nodoc
mixin _$NavBarState {
  @JsonKey(ignore: true)
  AsyncSnapshot<dynamic>? get asyncSnapshot =>
      throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NavBarStateCopyWith<NavBarState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavBarStateCopyWith<$Res> {
  factory $NavBarStateCopyWith(
          NavBarState value, $Res Function(NavBarState) then) =
      _$NavBarStateCopyWithImpl<$Res, NavBarState>;
  @useResult
  $Res call(
      {@JsonKey(ignore: true) AsyncSnapshot<dynamic>? asyncSnapshot,
      int index});
}

/// @nodoc
class _$NavBarStateCopyWithImpl<$Res, $Val extends NavBarState>
    implements $NavBarStateCopyWith<$Res> {
  _$NavBarStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? asyncSnapshot = freezed,
    Object? index = null,
  }) {
    return _then(_value.copyWith(
      asyncSnapshot: freezed == asyncSnapshot
          ? _value.asyncSnapshot
          : asyncSnapshot // ignore: cast_nullable_to_non_nullable
              as AsyncSnapshot<dynamic>?,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NavBarStateCopyWith<$Res>
    implements $NavBarStateCopyWith<$Res> {
  factory _$$_NavBarStateCopyWith(
          _$_NavBarState value, $Res Function(_$_NavBarState) then) =
      __$$_NavBarStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(ignore: true) AsyncSnapshot<dynamic>? asyncSnapshot,
      int index});
}

/// @nodoc
class __$$_NavBarStateCopyWithImpl<$Res>
    extends _$NavBarStateCopyWithImpl<$Res, _$_NavBarState>
    implements _$$_NavBarStateCopyWith<$Res> {
  __$$_NavBarStateCopyWithImpl(
      _$_NavBarState _value, $Res Function(_$_NavBarState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? asyncSnapshot = freezed,
    Object? index = null,
  }) {
    return _then(_$_NavBarState(
      asyncSnapshot: freezed == asyncSnapshot
          ? _value.asyncSnapshot
          : asyncSnapshot // ignore: cast_nullable_to_non_nullable
              as AsyncSnapshot<dynamic>?,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NavBarState extends _NavBarState {
  const _$_NavBarState(
      {@JsonKey(ignore: true) this.asyncSnapshot, this.index = 0})
      : super._();

  factory _$_NavBarState.fromJson(Map<String, dynamic> json) =>
      _$$_NavBarStateFromJson(json);

  @override
  @JsonKey(ignore: true)
  final AsyncSnapshot<dynamic>? asyncSnapshot;
  @override
  @JsonKey()
  final int index;

  @override
  String toString() {
    return 'NavBarState(asyncSnapshot: $asyncSnapshot, index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NavBarState &&
            (identical(other.asyncSnapshot, asyncSnapshot) ||
                other.asyncSnapshot == asyncSnapshot) &&
            (identical(other.index, index) || other.index == index));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, asyncSnapshot, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NavBarStateCopyWith<_$_NavBarState> get copyWith =>
      __$$_NavBarStateCopyWithImpl<_$_NavBarState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NavBarStateToJson(
      this,
    );
  }
}

abstract class _NavBarState extends NavBarState {
  const factory _NavBarState(
      {@JsonKey(ignore: true) final AsyncSnapshot<dynamic>? asyncSnapshot,
      final int index}) = _$_NavBarState;
  const _NavBarState._() : super._();

  factory _NavBarState.fromJson(Map<String, dynamic> json) =
      _$_NavBarState.fromJson;

  @override
  @JsonKey(ignore: true)
  AsyncSnapshot<dynamic>? get asyncSnapshot;
  @override
  int get index;
  @override
  @JsonKey(ignore: true)
  _$$_NavBarStateCopyWith<_$_NavBarState> get copyWith =>
      throw _privateConstructorUsedError;
}
