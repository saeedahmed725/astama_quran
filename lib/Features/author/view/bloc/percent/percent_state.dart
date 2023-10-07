part of 'percent_bloc.dart';

class PercentState extends Equatable {
  final double percent;
  final int index;

  const PercentState(this.percent, this.index);

  @override
  List<Object> get props => [percent, index];
}
