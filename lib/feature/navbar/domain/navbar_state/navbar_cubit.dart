import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'navbar_state.dart';
part 'navbar_cubit.freezed.dart';
part 'navbar_cubit.g.dart';

class NavbarCubit extends HydratedCubit<NavBarState> {
  NavbarCubit() : super(NavBarState.notAuthorized());

  @override
  fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic>? toJson(state) {
    return state.toJson();
  }
}

// class NavbarBloc extends Bloc<NavbarItems, NavbarState> {
//   @override
//   NavbarState get initialState => ShowRed();

//   @override
//   Stream<NavbarState> mapEventToState(
//       NavbarState state, NavbarItems event) async* {
//     switch (event) {
//       case NavbarItems.Blue:
//         yield ShowBlue();
//         break;
//       case NavbarItems.Green:
//         yield ShowGreen();
//         break;
//       default:
//         yield ShowRed();
//         break;
//     }
//   }