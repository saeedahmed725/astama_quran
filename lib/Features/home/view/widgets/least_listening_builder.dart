import 'package:astama/Features/author/view/bloc/LeastListening/least_listening_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home_bloc.dart';
import 'least_listening.dart';

class LeastListeningBuilder extends StatelessWidget {
  const LeastListeningBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, loadingState) {
        if (loadingState is LoadingReciterListSuccess) {
          return BlocBuilder<LeastListeningBloc, LeastListeningState>(
            builder: (context, state) {
              if (state is GetLeastListeningReciterState) {
                if (state.reciter != null && state.surah != null) {
                  return LeastListening(
                    loadingState: loadingState,
                    state: state,
                  );
                } else {
                  return const SizedBox();
                }
              } else {
                return const SizedBox();
              }
            },
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
