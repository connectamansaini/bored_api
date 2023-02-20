import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bored/src/bored/models/bored.dart';
import 'package:bored/src/bored/repository/bored_repository.dart';
import 'package:bored/src/core/domain/enums.dart';

part 'bored_event.dart';
part 'bored_state.dart';

class BoredBloc extends Bloc<BoredEvent, BoredState> {
  BoredBloc(this.boredRepository) : super(BoredState()) {
    on<BoredDataRequested>(_onBoredDataRequested);
  }
  final BoredRepository boredRepository;

  Future<void> _onBoredDataRequested(
    BoredDataRequested event,
    Emitter<BoredState> emit,
  ) async {
    try {
      emit(
        state.copyWith(boredDataStatus: BoredDataStatus.loading),
      );
      final boredData = await boredRepository.getData();

      emit(
        state.copyWith(
          bored: boredData,
          boredDataStatus: BoredDataStatus.success,
        ),
      );
    } catch (e) {
      emit(state.copyWith(boredDataStatus: BoredDataStatus.failure));
    }
  }
}
