import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/utils/function.dart';

part 'least_listening_event.dart';

part 'least_listening_state.dart';

class LeastListeningBloc
    extends Bloc<LeastListeningEvent, LeastListeningState> {
  LeastListeningBloc() : super(LeastListeningInitial()) {
    on<LeastListeningEvent>((event, emit) async {
      if (event is SetLeastListeningReciterEvent) {
        setLeastListeningReciter(event.index);
      } else if (event is SetLeastListeningSurahEvent) {
        setLeastListeningSurah(event.index);
      } else if (event is GetLeastListeningReciterEvent) {
        emit(GetLeastListeningReciterState(await getLeastListeningReciter(), await getLeastListeningSurah()));
      }
    });
  }
}
