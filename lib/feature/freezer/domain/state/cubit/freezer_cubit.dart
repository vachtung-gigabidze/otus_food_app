// import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:otus_food_app/feature/freezer/domain/entities/freezer.dart';
import 'package:otus_food_app/feature/freezer/freezer_repository.dart';

part 'freezer_state.dart';
part 'freezer_cubit.freezed.dart';
part 'freezer_cubit.g.dart';

class FreezerCubit extends HydratedCubit<FreezerState> {
  FreezerCubit(this.repository)
      : super(const FreezerState(asyncSnapshot: AsyncSnapshot.nothing()));

  final FreezerRepository repository;

  Future<void> fetchFreezer() async {
    await repository.fetchFreezer(3).then((value) {
      // final List<Freezer> freezerValues = value;
      final Iterable iterable = value;
      emit(state.copyWith(
          freezerList: iterable.map((f) => Freezer.fromJson(f)).toList(),
          asyncSnapshot:
              const AsyncSnapshot.withData(ConnectionState.done, true)));
    }).catchError((error) {
      addError(error);
    });
  }

  @override
  void addError(Object error, [StackTrace? stackTrace]) {
    emit(state.copyWith(
        asyncSnapshot: AsyncSnapshot.withError(ConnectionState.done, error)));
    super.addError(error, stackTrace);
  }

  @override
  FreezerState? fromJson(Map<String, dynamic> json) {
    return FreezerState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(FreezerState state) {
    return state.toJson();
  }
}
