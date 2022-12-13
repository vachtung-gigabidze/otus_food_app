part of 'freezer_cubit.dart';

@freezed
class FreezerState with _$FreezerState {
  const FreezerState._();

  const factory FreezerState(
      // ignore: invalid_annotation_target
      {@JsonKey(ignore: true) AsyncSnapshot? asyncSnapshot,
      @Default([]) List<Freezer> freezerList}) = _FreezerState;

  factory FreezerState.fromJson(Map<String, dynamic> json) =>
      _$FreezerStateFromJson(json);
}
