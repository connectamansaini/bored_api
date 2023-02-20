part of 'bored_bloc.dart';

class BoredState {
  BoredState({
    this.bored = Bored.empty,
    this.boredDataStatus = BoredDataStatus.initial,
  });

  final Bored bored;
  final BoredDataStatus boredDataStatus;

  BoredState copyWith({
    Bored? bored,
    BoredDataStatus? boredDataStatus,
  }) {
    return BoredState(
      bored: bored ?? this.bored,
      boredDataStatus: boredDataStatus ?? this.boredDataStatus,
    );
  }
}
