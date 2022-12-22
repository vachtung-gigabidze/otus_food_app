import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'navbar_state.dart';
part 'navbar_cubit.freezed.dart';
part 'navbar_cubit.g.dart';

class NavbarCubit extends HydratedCubit<NavBarState> {
  NavbarCubit()
      : super(const NavBarState(asyncSnapshot: AsyncSnapshot.nothing()));

  void selectPage(int index) {
    emit(state.copyWith(index: index));
  }

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
