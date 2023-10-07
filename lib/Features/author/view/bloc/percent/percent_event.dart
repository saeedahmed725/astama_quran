part of 'percent_bloc.dart';

abstract class PercentEvent extends Equatable {
  const PercentEvent();

  @override
  List<Object> get props => [];
}

class UpdatePercent extends PercentEvent {
  final double percent;
  final int index;

  const UpdatePercent(this.percent, this.index);

  @override
  List<Object> get props => [percent, index];
}
