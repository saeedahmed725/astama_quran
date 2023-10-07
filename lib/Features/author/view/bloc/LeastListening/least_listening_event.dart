part of 'least_listening_bloc.dart';

abstract class LeastListeningEvent extends Equatable {
  const LeastListeningEvent();
}

class SetLeastListeningSurahEvent extends LeastListeningEvent {
  final int index;

  const SetLeastListeningSurahEvent(this.index);

  @override
  List<Object?> get props => [index];
}

class SetLeastListeningReciterEvent extends LeastListeningEvent {
  final int index;

  const SetLeastListeningReciterEvent(this.index);

  @override
  List<Object?> get props => [index];
}

class GetLeastListeningReciterEvent extends LeastListeningEvent {
  @override
  List<Object?> get props => [];
}
