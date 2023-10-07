import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'percent_event.dart';

part 'percent_state.dart';

class PercentBloc extends Bloc<PercentEvent, PercentState> {
  int index = -1;

  PercentBloc() : super(const PercentState(0, -1)) {
    on<UpdatePercent>((event, emit) {
      index = event.index;
      if (event.percent == 1) index = -1;
      emit(PercentState(event.percent, index));
    });
  }
}
