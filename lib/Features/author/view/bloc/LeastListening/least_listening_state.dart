part of 'least_listening_bloc.dart';

abstract class LeastListeningState extends Equatable {
  const LeastListeningState();
}

class LeastListeningInitial extends LeastListeningState {
  @override
  List<Object> get props => [];
}
class GetLeastListeningReciterState extends LeastListeningState {
  final int? reciter;
  final int? surah;

  const GetLeastListeningReciterState(this.reciter, this.surah);

  @override
  List<Object?> get props => [reciter, surah];
}