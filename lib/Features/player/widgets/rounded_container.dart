import 'package:align_positioned/align_positioned.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';

import '../../../core/bloc/theme/theme_bloc.dart';

class RoundedContainer extends StatelessWidget {
  const RoundedContainer({
    super.key,
    required SequenceAnimation sequenceAnimation,
    required this.minimized,
  }) : _sequenceAnimation = sequenceAnimation;

  final SequenceAnimation _sequenceAnimation;
  final bool minimized;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
      if (state is LoadedThemeState) {
        return AlignPositioned(
          dx: _sequenceAnimation['RoundContainerPosition'].value.dx,
          dy: _sequenceAnimation['RoundContainerPosition'].value.dy,
          child: Container(
            width: _sequenceAnimation['RoundContainerWidth'].value,
            height: _sequenceAnimation['RoundContainerHeight'].value,
            margin: EdgeInsets.only(bottom: minimized ? 0.05.sh : 0),
            decoration: BoxDecoration(
              color: state.themeValue ? const Color(0xff2e2e2e) : Colors.white,
              boxShadow: state.themeValue
                  ? [const BoxShadow(color: Color(0xff434343), blurRadius: 10)]
                  : [BoxShadow(color: Colors.grey.shade400, blurRadius: 10)],
              borderRadius:
                  _sequenceAnimation['RoundContainerBorderRadius'].value,
            ),
          ),
        );
      } else {
        return Container();
      }
    });
  }
}
