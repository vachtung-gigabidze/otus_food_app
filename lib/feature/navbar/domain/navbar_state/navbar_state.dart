part of 'navbar_cubit.dart';

@freezed
class NavBarState with _$NavBarState {
  factory NavBarState.notAuthorized() = _NavBarStateNonAuthorized;
  factory NavBarState.authorized() = _NavBarStateAuthorized;
  factory NavBarState.waiting() = _NavBarStateWaiting;
  factory NavBarState.error(dynamic error) = _NavBarStateStateError;

  factory NavBarState.fromJson(Map<String, dynamic> json) =>
      _$NavBarStateFromJson(json);
}
