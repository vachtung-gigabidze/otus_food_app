// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'recipe_list_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RecipeListState _$RecipeListStateFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'empty':
      return _RecipeListStateEmpty.fromJson(json);
    case 'loaded':
      return _RecipeListStateLoaded.fromJson(json);
    case 'waiting':
      return _RecipeListStateWaiting.fromJson(json);
    case 'error':
      return _RecipeListStateError.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'RecipeListState',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$RecipeListState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function(List<Recipe> recipeList) loaded,
    required TResult Function() waiting,
    required TResult Function(dynamic error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function(List<Recipe> recipeList)? loaded,
    TResult? Function()? waiting,
    TResult? Function(dynamic error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function(List<Recipe> recipeList)? loaded,
    TResult Function()? waiting,
    TResult Function(dynamic error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RecipeListStateEmpty value) empty,
    required TResult Function(_RecipeListStateLoaded value) loaded,
    required TResult Function(_RecipeListStateWaiting value) waiting,
    required TResult Function(_RecipeListStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RecipeListStateEmpty value)? empty,
    TResult? Function(_RecipeListStateLoaded value)? loaded,
    TResult? Function(_RecipeListStateWaiting value)? waiting,
    TResult? Function(_RecipeListStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RecipeListStateEmpty value)? empty,
    TResult Function(_RecipeListStateLoaded value)? loaded,
    TResult Function(_RecipeListStateWaiting value)? waiting,
    TResult Function(_RecipeListStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeListStateCopyWith<$Res> {
  factory $RecipeListStateCopyWith(
          RecipeListState value, $Res Function(RecipeListState) then) =
      _$RecipeListStateCopyWithImpl<$Res, RecipeListState>;
}

/// @nodoc
class _$RecipeListStateCopyWithImpl<$Res, $Val extends RecipeListState>
    implements $RecipeListStateCopyWith<$Res> {
  _$RecipeListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_RecipeListStateEmptyCopyWith<$Res> {
  factory _$$_RecipeListStateEmptyCopyWith(_$_RecipeListStateEmpty value,
          $Res Function(_$_RecipeListStateEmpty) then) =
      __$$_RecipeListStateEmptyCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_RecipeListStateEmptyCopyWithImpl<$Res>
    extends _$RecipeListStateCopyWithImpl<$Res, _$_RecipeListStateEmpty>
    implements _$$_RecipeListStateEmptyCopyWith<$Res> {
  __$$_RecipeListStateEmptyCopyWithImpl(_$_RecipeListStateEmpty _value,
      $Res Function(_$_RecipeListStateEmpty) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$_RecipeListStateEmpty implements _RecipeListStateEmpty {
  _$_RecipeListStateEmpty({final String? $type}) : $type = $type ?? 'empty';

  factory _$_RecipeListStateEmpty.fromJson(Map<String, dynamic> json) =>
      _$$_RecipeListStateEmptyFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'RecipeListState.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_RecipeListStateEmpty);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function(List<Recipe> recipeList) loaded,
    required TResult Function() waiting,
    required TResult Function(dynamic error) error,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function(List<Recipe> recipeList)? loaded,
    TResult? Function()? waiting,
    TResult? Function(dynamic error)? error,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function(List<Recipe> recipeList)? loaded,
    TResult Function()? waiting,
    TResult Function(dynamic error)? error,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RecipeListStateEmpty value) empty,
    required TResult Function(_RecipeListStateLoaded value) loaded,
    required TResult Function(_RecipeListStateWaiting value) waiting,
    required TResult Function(_RecipeListStateError value) error,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RecipeListStateEmpty value)? empty,
    TResult? Function(_RecipeListStateLoaded value)? loaded,
    TResult? Function(_RecipeListStateWaiting value)? waiting,
    TResult? Function(_RecipeListStateError value)? error,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RecipeListStateEmpty value)? empty,
    TResult Function(_RecipeListStateLoaded value)? loaded,
    TResult Function(_RecipeListStateWaiting value)? waiting,
    TResult Function(_RecipeListStateError value)? error,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecipeListStateEmptyToJson(
      this,
    );
  }
}

abstract class _RecipeListStateEmpty implements RecipeListState {
  factory _RecipeListStateEmpty() = _$_RecipeListStateEmpty;

  factory _RecipeListStateEmpty.fromJson(Map<String, dynamic> json) =
      _$_RecipeListStateEmpty.fromJson;
}

/// @nodoc
abstract class _$$_RecipeListStateLoadedCopyWith<$Res> {
  factory _$$_RecipeListStateLoadedCopyWith(_$_RecipeListStateLoaded value,
          $Res Function(_$_RecipeListStateLoaded) then) =
      __$$_RecipeListStateLoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Recipe> recipeList});
}

/// @nodoc
class __$$_RecipeListStateLoadedCopyWithImpl<$Res>
    extends _$RecipeListStateCopyWithImpl<$Res, _$_RecipeListStateLoaded>
    implements _$$_RecipeListStateLoadedCopyWith<$Res> {
  __$$_RecipeListStateLoadedCopyWithImpl(_$_RecipeListStateLoaded _value,
      $Res Function(_$_RecipeListStateLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipeList = null,
  }) {
    return _then(_$_RecipeListStateLoaded(
      null == recipeList
          ? _value._recipeList
          : recipeList // ignore: cast_nullable_to_non_nullable
              as List<Recipe>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RecipeListStateLoaded implements _RecipeListStateLoaded {
  _$_RecipeListStateLoaded(final List<Recipe> recipeList, {final String? $type})
      : _recipeList = recipeList,
        $type = $type ?? 'loaded';

  factory _$_RecipeListStateLoaded.fromJson(Map<String, dynamic> json) =>
      _$$_RecipeListStateLoadedFromJson(json);

  final List<Recipe> _recipeList;
  @override
  List<Recipe> get recipeList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recipeList);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'RecipeListState.loaded(recipeList: $recipeList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecipeListStateLoaded &&
            const DeepCollectionEquality()
                .equals(other._recipeList, _recipeList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_recipeList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RecipeListStateLoadedCopyWith<_$_RecipeListStateLoaded> get copyWith =>
      __$$_RecipeListStateLoadedCopyWithImpl<_$_RecipeListStateLoaded>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function(List<Recipe> recipeList) loaded,
    required TResult Function() waiting,
    required TResult Function(dynamic error) error,
  }) {
    return loaded(recipeList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function(List<Recipe> recipeList)? loaded,
    TResult? Function()? waiting,
    TResult? Function(dynamic error)? error,
  }) {
    return loaded?.call(recipeList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function(List<Recipe> recipeList)? loaded,
    TResult Function()? waiting,
    TResult Function(dynamic error)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(recipeList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RecipeListStateEmpty value) empty,
    required TResult Function(_RecipeListStateLoaded value) loaded,
    required TResult Function(_RecipeListStateWaiting value) waiting,
    required TResult Function(_RecipeListStateError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RecipeListStateEmpty value)? empty,
    TResult? Function(_RecipeListStateLoaded value)? loaded,
    TResult? Function(_RecipeListStateWaiting value)? waiting,
    TResult? Function(_RecipeListStateError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RecipeListStateEmpty value)? empty,
    TResult Function(_RecipeListStateLoaded value)? loaded,
    TResult Function(_RecipeListStateWaiting value)? waiting,
    TResult Function(_RecipeListStateError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecipeListStateLoadedToJson(
      this,
    );
  }
}

abstract class _RecipeListStateLoaded implements RecipeListState {
  factory _RecipeListStateLoaded(final List<Recipe> recipeList) =
      _$_RecipeListStateLoaded;

  factory _RecipeListStateLoaded.fromJson(Map<String, dynamic> json) =
      _$_RecipeListStateLoaded.fromJson;

  List<Recipe> get recipeList;
  @JsonKey(ignore: true)
  _$$_RecipeListStateLoadedCopyWith<_$_RecipeListStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RecipeListStateWaitingCopyWith<$Res> {
  factory _$$_RecipeListStateWaitingCopyWith(_$_RecipeListStateWaiting value,
          $Res Function(_$_RecipeListStateWaiting) then) =
      __$$_RecipeListStateWaitingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_RecipeListStateWaitingCopyWithImpl<$Res>
    extends _$RecipeListStateCopyWithImpl<$Res, _$_RecipeListStateWaiting>
    implements _$$_RecipeListStateWaitingCopyWith<$Res> {
  __$$_RecipeListStateWaitingCopyWithImpl(_$_RecipeListStateWaiting _value,
      $Res Function(_$_RecipeListStateWaiting) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$_RecipeListStateWaiting implements _RecipeListStateWaiting {
  _$_RecipeListStateWaiting({final String? $type}) : $type = $type ?? 'waiting';

  factory _$_RecipeListStateWaiting.fromJson(Map<String, dynamic> json) =>
      _$$_RecipeListStateWaitingFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'RecipeListState.waiting()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecipeListStateWaiting);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function(List<Recipe> recipeList) loaded,
    required TResult Function() waiting,
    required TResult Function(dynamic error) error,
  }) {
    return waiting();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function(List<Recipe> recipeList)? loaded,
    TResult? Function()? waiting,
    TResult? Function(dynamic error)? error,
  }) {
    return waiting?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function(List<Recipe> recipeList)? loaded,
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
    required TResult Function(_RecipeListStateEmpty value) empty,
    required TResult Function(_RecipeListStateLoaded value) loaded,
    required TResult Function(_RecipeListStateWaiting value) waiting,
    required TResult Function(_RecipeListStateError value) error,
  }) {
    return waiting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RecipeListStateEmpty value)? empty,
    TResult? Function(_RecipeListStateLoaded value)? loaded,
    TResult? Function(_RecipeListStateWaiting value)? waiting,
    TResult? Function(_RecipeListStateError value)? error,
  }) {
    return waiting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RecipeListStateEmpty value)? empty,
    TResult Function(_RecipeListStateLoaded value)? loaded,
    TResult Function(_RecipeListStateWaiting value)? waiting,
    TResult Function(_RecipeListStateError value)? error,
    required TResult orElse(),
  }) {
    if (waiting != null) {
      return waiting(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecipeListStateWaitingToJson(
      this,
    );
  }
}

abstract class _RecipeListStateWaiting implements RecipeListState {
  factory _RecipeListStateWaiting() = _$_RecipeListStateWaiting;

  factory _RecipeListStateWaiting.fromJson(Map<String, dynamic> json) =
      _$_RecipeListStateWaiting.fromJson;
}

/// @nodoc
abstract class _$$_RecipeListStateErrorCopyWith<$Res> {
  factory _$$_RecipeListStateErrorCopyWith(_$_RecipeListStateError value,
          $Res Function(_$_RecipeListStateError) then) =
      __$$_RecipeListStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({dynamic error});
}

/// @nodoc
class __$$_RecipeListStateErrorCopyWithImpl<$Res>
    extends _$RecipeListStateCopyWithImpl<$Res, _$_RecipeListStateError>
    implements _$$_RecipeListStateErrorCopyWith<$Res> {
  __$$_RecipeListStateErrorCopyWithImpl(_$_RecipeListStateError _value,
      $Res Function(_$_RecipeListStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$_RecipeListStateError(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RecipeListStateError implements _RecipeListStateError {
  _$_RecipeListStateError(this.error, {final String? $type})
      : $type = $type ?? 'error';

  factory _$_RecipeListStateError.fromJson(Map<String, dynamic> json) =>
      _$$_RecipeListStateErrorFromJson(json);

  @override
  final dynamic error;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'RecipeListState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecipeListStateError &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RecipeListStateErrorCopyWith<_$_RecipeListStateError> get copyWith =>
      __$$_RecipeListStateErrorCopyWithImpl<_$_RecipeListStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function(List<Recipe> recipeList) loaded,
    required TResult Function() waiting,
    required TResult Function(dynamic error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function(List<Recipe> recipeList)? loaded,
    TResult? Function()? waiting,
    TResult? Function(dynamic error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function(List<Recipe> recipeList)? loaded,
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
    required TResult Function(_RecipeListStateEmpty value) empty,
    required TResult Function(_RecipeListStateLoaded value) loaded,
    required TResult Function(_RecipeListStateWaiting value) waiting,
    required TResult Function(_RecipeListStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RecipeListStateEmpty value)? empty,
    TResult? Function(_RecipeListStateLoaded value)? loaded,
    TResult? Function(_RecipeListStateWaiting value)? waiting,
    TResult? Function(_RecipeListStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RecipeListStateEmpty value)? empty,
    TResult Function(_RecipeListStateLoaded value)? loaded,
    TResult Function(_RecipeListStateWaiting value)? waiting,
    TResult Function(_RecipeListStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecipeListStateErrorToJson(
      this,
    );
  }
}

abstract class _RecipeListStateError implements RecipeListState {
  factory _RecipeListStateError(final dynamic error) = _$_RecipeListStateError;

  factory _RecipeListStateError.fromJson(Map<String, dynamic> json) =
      _$_RecipeListStateError.fromJson;

  dynamic get error;
  @JsonKey(ignore: true)
  _$$_RecipeListStateErrorCopyWith<_$_RecipeListStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
