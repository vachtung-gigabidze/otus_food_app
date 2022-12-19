import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'navbar_state.dart';
part 'navbar_cubit.freezed.dart';
part 'navbar_cubit.g.dart';

class NavbarCubit extends HydratedCubit<NavBarState> {
  NavbarCubit()
      : super(const NavBarState(asyncSnapshot: AsyncSnapshot.nothing()));

  //  Future<void> fetchFreezer() async {
  //   await repository.fetchFreezer(3).then((value) {
  //     // final List<Freezer> freezerValues = value;
  //     //final Iterable iterable = value;
  //     emit(state.copyWith(
  //         //freezerList: iterable.map((f) => Freezer.fromJson(f)).toList(),
  //         freezerList: value,
  //         asyncSnapshot:
  //             const AsyncSnapshot.withData(ConnectionState.done, true)));
  //   }).catchError((error) {
  //     addError(error);
  //   });
  // }

  @override
  void addError(Object error, [StackTrace? stackTrace]) {
    emit(state.copyWith(
        asyncSnapshot: AsyncSnapshot.withError(ConnectionState.done, error)));
    super.addError(error, stackTrace);
  }

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