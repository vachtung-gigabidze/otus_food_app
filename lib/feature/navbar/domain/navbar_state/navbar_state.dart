part of 'navbar_cubit.dart';

@freezed
class NavBarState with _$NavBarState {
  const NavBarState._();
  const factory NavBarState(
      // ignore: invalid_annotation_target
      {@JsonKey(ignore: true) AsyncSnapshot? asyncSnapshot,
      @Default(0) int index}) = _NavBarState;

  factory NavBarState.fromJson(Map<String, dynamic> json) =>
      _$NavBarStateFromJson(json);
}
