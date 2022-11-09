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
  switch (json['runtimeType']) {
    case 'notAuthorized':
      return _NavBarStateNonAuthorized.fromJson(json);
    case 'authorized':
      return _NavBarStateAuthorized.fromJson(json);
    case 'waiting':
      return _NavBarStateWaiting.fromJson(json);
    case 'error':
      return _NavBarStateStateError.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'NavBarState',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$NavBarState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notAuthorized,
    required TResult Function() authorized,
    required TResult Function() waiting,
    required TResult Function(dynamic error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notAuthorized,
    TResult? Function()? authorized,
    TResult? Function()? waiting,
    TResult? Function(dynamic error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notAuthorized,
    TResult Function()? authorized,
    TResult Function()? waiting,
    TResult Function(dynamic error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NavBarStateNonAuthorized value) notAuthorized,
    required TResult Function(_NavBarStateAuthorized value) authorized,
    required TResult Function(_NavBarStateWaiting value) waiting,
    required TResult Function(_NavBarStateStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NavBarStateNonAuthorized value)? notAuthorized,
    TResult? Function(_NavBarStateAuthorized value)? authorized,
    TResult? Function(_NavBarStateWaiting value)? waiting,
    TResult? Function(_NavBarStateStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NavBarStateNonAuthorized value)? notAuthorized,
    TResult Function(_NavBarStateAuthorized value)? authorized,
    TResult Function(_NavBarStateWaiting value)? waiting,
    TResult Function(_NavBarStateStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavBarStateCopyWith<$Res> {
  factory $NavBarStateCopyWith(
          NavBarState value, $Res Function(NavBarState) then) =
      _$NavBarStateCopyWithImpl<$Res, NavBarState>;
}

/// @nodoc
class _$NavBarStateCopyWithImpl<$Res, $Val extends NavBarState>
    implements $NavBarStateCopyWith<$Res> {
  _$NavBarStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_NavBarStateNonAuthorizedCopyWith<$Res> {
  factory _$$_NavBarStateNonAuthorizedCopyWith(
          _$_NavBarStateNonAuthorized value,
          $Res Function(_$_NavBarStateNonAuthorized) then) =
      __$$_NavBarStateNonAuthorizedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_NavBarStateNonAuthorizedCopyWithImpl<$Res>
    extends _$NavBarStateCopyWithImpl<$Res, _$_NavBarStateNonAuthorized>
    implements _$$_NavBarStateNonAuthorizedCopyWith<$Res> {
  __$$_NavBarStateNonAuthorizedCopyWithImpl(_$_NavBarStateNonAuthorized _value,
      $Res Function(_$_NavBarStateNonAuthorized) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$_NavBarStateNonAuthorized implements _NavBarStateNonAuthorized {
  _$_NavBarStateNonAuthorized({final String? $type})
      : $type = $type ?? 'notAuthorized';

  factory _$_NavBarStateNonAuthorized.fromJson(Map<String, dynamic> json) =>
      _$$_NavBarStateNonAuthorizedFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'NavBarState.notAuthorized()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NavBarStateNonAuthorized);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notAuthorized,
    required TResult Function() authorized,
    required TResult Function() waiting,
    required TResult Function(dynamic error) error,
  }) {
    return notAuthorized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notAuthorized,
    TResult? Function()? authorized,
    TResult? Function()? waiting,
    TResult? Function(dynamic error)? error,
  }) {
    return notAuthorized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notAuthorized,
    TResult Function()? authorized,
    TResult Function()? waiting,
    TResult Function(dynamic error)? error,
    required TResult orElse(),
  }) {
    if (notAuthorized != null) {
      return notAuthorized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NavBarStateNonAuthorized value) notAuthorized,
    required TResult Function(_NavBarStateAuthorized value) authorized,
    required TResult Function(_NavBarStateWaiting value) waiting,
    required TResult Function(_NavBarStateStateError value) error,
  }) {
    return notAuthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NavBarStateNonAuthorized value)? notAuthorized,
    TResult? Function(_NavBarStateAuthorized value)? authorized,
    TResult? Function(_NavBarStateWaiting value)? waiting,
    TResult? Function(_NavBarStateStateError value)? error,
  }) {
    return notAuthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NavBarStateNonAuthorized value)? notAuthorized,
    TResult Function(_NavBarStateAuthorized value)? authorized,
    TResult Function(_NavBarStateWaiting value)? waiting,
    TResult Function(_NavBarStateStateError value)? error,
    required TResult orElse(),
  }) {
    if (notAuthorized != null) {
      return notAuthorized(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_NavBarStateNonAuthorizedToJson(
      this,
    );
  }
}

abstract class _NavBarStateNonAuthorized implements NavBarState {
  factory _NavBarStateNonAuthorized() = _$_NavBarStateNonAuthorized;

  factory _NavBarStateNonAuthorized.fromJson(Map<String, dynamic> json) =
      _$_NavBarStateNonAuthorized.fromJson;
}

/// @nodoc
abstract class _$$_NavBarStateAuthorizedCopyWith<$Res> {
  factory _$$_NavBarStateAuthorizedCopyWith(_$_NavBarStateAuthorized value,
          $Res Function(_$_NavBarStateAuthorized) then) =
      __$$_NavBarStateAuthorizedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_NavBarStateAuthorizedCopyWithImpl<$Res>
    extends _$NavBarStateCopyWithImpl<$Res, _$_NavBarStateAuthorized>
    implements _$$_NavBarStateAuthorizedCopyWith<$Res> {
  __$$_NavBarStateAuthorizedCopyWithImpl(_$_NavBarStateAuthorized _value,
      $Res Function(_$_NavBarStateAuthorized) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$_NavBarStateAuthorized implements _NavBarStateAuthorized {
  _$_NavBarStateAuthorized({final String? $type})
      : $type = $type ?? 'authorized';

  factory _$_NavBarStateAuthorized.fromJson(Map<String, dynamic> json) =>
      _$$_NavBarStateAuthorizedFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'NavBarState.authorized()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_NavBarStateAuthorized);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notAuthorized,
    required TResult Function() authorized,
    required TResult Function() waiting,
    required TResult Function(dynamic error) error,
  }) {
    return authorized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notAuthorized,
    TResult? Function()? authorized,
    TResult? Function()? waiting,
    TResult? Function(dynamic error)? error,
  }) {
    return authorized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notAuthorized,
    TResult Function()? authorized,
    TResult Function()? waiting,
    TResult Function(dynamic error)? error,
    required TResult orElse(),
  }) {
    if (authorized != null) {
      return authorized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NavBarStateNonAuthorized value) notAuthorized,
    required TResult Function(_NavBarStateAuthorized value) authorized,
    required TResult Function(_NavBarStateWaiting value) waiting,
    required TResult Function(_NavBarStateStateError value) error,
  }) {
    return authorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NavBarStateNonAuthorized value)? notAuthorized,
    TResult? Function(_NavBarStateAuthorized value)? authorized,
    TResult? Function(_NavBarStateWaiting value)? waiting,
    TResult? Function(_NavBarStateStateError value)? error,
  }) {
    return authorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NavBarStateNonAuthorized value)? notAuthorized,
    TResult Function(_NavBarStateAuthorized value)? authorized,
    TResult Function(_NavBarStateWaiting value)? waiting,
    TResult Function(_NavBarStateStateError value)? error,
    required TResult orElse(),
  }) {
    if (authorized != null) {
      return authorized(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_NavBarStateAuthorizedToJson(
      this,
    );
  }
}

abstract class _NavBarStateAuthorized implements NavBarState {
  factory _NavBarStateAuthorized() = _$_NavBarStateAuthorized;

  factory _NavBarStateAuthorized.fromJson(Map<String, dynamic> json) =
      _$_NavBarStateAuthorized.fromJson;
}

/// @nodoc
abstract class _$$_NavBarStateWaitingCopyWith<$Res> {
  factory _$$_NavBarStateWaitingCopyWith(_$_NavBarStateWaiting value,
          $Res Function(_$_NavBarStateWaiting) then) =
      __$$_NavBarStateWaitingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_NavBarStateWaitingCopyWithImpl<$Res>
    extends _$NavBarStateCopyWithImpl<$Res, _$_NavBarStateWaiting>
    implements _$$_NavBarStateWaitingCopyWith<$Res> {
  __$$_NavBarStateWaitingCopyWithImpl(
      _$_NavBarStateWaiting _value, $Res Function(_$_NavBarStateWaiting) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$_NavBarStateWaiting implements _NavBarStateWaiting {
  _$_NavBarStateWaiting({final String? $type}) : $type = $type ?? 'waiting';

  factory _$_NavBarStateWaiting.fromJson(Map<String, dynamic> json) =>
      _$$_NavBarStateWaitingFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'NavBarState.waiting()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_NavBarStateWaiting);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notAuthorized,
    required TResult Function() authorized,
    required TResult Function() waiting,
    required TResult Function(dynamic error) error,
  }) {
    return waiting();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notAuthorized,
    TResult? Function()? authorized,
    TResult? Function()? waiting,
    TResult? Function(dynamic error)? error,
  }) {
    return waiting?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notAuthorized,
    TResult Function()? authorized,
    TResult Function()? waiting,
    TResult Function(dynamic error)? error,
    required TResult orElse(),
  }) {
    if (waiting != null) {
      return waiting();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NavBarStateNonAuthorized value) notAuthorized,
    required TResult Function(_NavBarStateAuthorized value) authorized,
    required TResult Function(_NavBarStateWaiting value) waiting,
    required TResult Function(_NavBarStateStateError value) error,
  }) {
    return waiting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NavBarStateNonAuthorized value)? notAuthorized,
    TResult? Function(_NavBarStateAuthorized value)? authorized,
    TResult? Function(_NavBarStateWaiting value)? waiting,
    TResult? Function(_NavBarStateStateError value)? error,
  }) {
    return waiting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NavBarStateNonAuthorized value)? notAuthorized,
    TResult Function(_NavBarStateAuthorized value)? authorized,
    TResult Function(_NavBarStateWaiting value)? waiting,
    TResult Function(_NavBarStateStateError value)? error,
    required TResult orElse(),
  }) {
    if (waiting != null) {
      return waiting(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_NavBarStateWaitingToJson(
      this,
    );
  }
}

abstract class _NavBarStateWaiting implements NavBarState {
  factory _NavBarStateWaiting() = _$_NavBarStateWaiting;

  factory _NavBarStateWaiting.fromJson(Map<String, dynamic> json) =
      _$_NavBarStateWaiting.fromJson;
}

/// @nodoc
abstract class _$$_NavBarStateStateErrorCopyWith<$Res> {
  factory _$$_NavBarStateStateErrorCopyWith(_$_NavBarStateStateError value,
          $Res Function(_$_NavBarStateStateError) then) =
      __$$_NavBarStateStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({dynamic error});
}

/// @nodoc
class __$$_NavBarStateStateErrorCopyWithImpl<$Res>
    extends _$NavBarStateCopyWithImpl<$Res, _$_NavBarStateStateError>
    implements _$$_NavBarStateStateErrorCopyWith<$Res> {
  __$$_NavBarStateStateErrorCopyWithImpl(_$_NavBarStateStateError _value,
      $Res Function(_$_NavBarStateStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$_NavBarStateStateError(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NavBarStateStateError implements _NavBarStateStateError {
  _$_NavBarStateStateError(this.error, {final String? $type})
      : $type = $type ?? 'error';

  factory _$_NavBarStateStateError.fromJson(Map<String, dynamic> json) =>
      _$$_NavBarStateStateErrorFromJson(json);

  @override
  final dynamic error;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'NavBarState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NavBarStateStateError &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NavBarStateStateErrorCopyWith<_$_NavBarStateStateError> get copyWith =>
      __$$_NavBarStateStateErrorCopyWithImpl<_$_NavBarStateStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notAuthorized,
    required TResult Function() authorized,
    required TResult Function() waiting,
    required TResult Function(dynamic error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notAuthorized,
    TResult? Function()? authorized,
    TResult? Function()? waiting,
    TResult? Function(dynamic error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notAuthorized,
    TResult Function()? authorized,
    TResult Function()? waiting,
    TResult Function(dynamic error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_NavBarStateNonAuthorized value) notAuthorized,
    required TResult Function(_NavBarStateAuthorized value) authorized,
    required TResult Function(_NavBarStateWaiting value) waiting,
    required TResult Function(_NavBarStateStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_NavBarStateNonAuthorized value)? notAuthorized,
    TResult? Function(_NavBarStateAuthorized value)? authorized,
    TResult? Function(_NavBarStateWaiting value)? waiting,
    TResult? Function(_NavBarStateStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_NavBarStateNonAuthorized value)? notAuthorized,
    TResult Function(_NavBarStateAuthorized value)? authorized,
    TResult Function(_NavBarStateWaiting value)? waiting,
    TResult Function(_NavBarStateStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_NavBarStateStateErrorToJson(
      this,
    );
  }
}

abstract class _NavBarStateStateError implements NavBarState {
  factory _NavBarStateStateError(final dynamic error) =
      _$_NavBarStateStateError;

  factory _NavBarStateStateError.fromJson(Map<String, dynamic> json) =
      _$_NavBarStateStateError.fromJson;

  dynamic get error;
  @JsonKey(ignore: true)
  _$$_NavBarStateStateErrorCopyWith<_$_NavBarStateStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
