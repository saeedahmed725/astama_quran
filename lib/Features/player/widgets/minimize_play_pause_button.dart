import 'package:align_positioned/align_positioned.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:astama/core/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';

import '../../author/view/bloc/author/author_bloc.dart';

class MinimizePlayPauseButton extends StatelessWidget {
  const MinimizePlayPauseButton(
      {super.key,
      required this.screenWidth,
      required this.screenHeight,
      required this.sequenceAnimation,
      this.onPressed});

  final double screenWidth;

  final double screenHeight;

  final SequenceAnimation sequenceAnimation;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final player =
        context.read<AuthorBloc>().playerController.assetsAudioPlayer;
    return player.builderIsPlaying(
      builder: (context, isPlaying) {
        return AlignPositioned(
          dx: screenWidth * 0.35,
          dy: screenHeight * 0.395,
          child: Opacity(
            opacity: sequenceAnimation['MinimizeButtonOpacity'].value,
            child: SizedBox(
              width: 60,
              height: 60,
              child: GestureDetector(
                onTap: () {
                  player.playOrPause();
                  onPressed;
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColor.kPrimaryColor, shape: BoxShape.circle),
                  child: Icon(
                    isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
