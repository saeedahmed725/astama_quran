import 'package:align_positioned/align_positioned.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:astama/Features/player/widgets/playing_controls_builder.dart';
import 'package:astama/Features/player/widgets/position_seek_widget_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';

import '../../../core/shared/custom_text.dart';

class PlayingControlsButtonAndNameAreaBuilder extends StatelessWidget {
  const PlayingControlsButtonAndNameAreaBuilder({
    super.key,
    required SequenceAnimation sequenceAnimation,
    required double screenHeight,
    required this.playing,
  })  : _sequenceAnimation = sequenceAnimation,
        _screenHeight = screenHeight;

  final SequenceAnimation _sequenceAnimation;
  final double _screenHeight;
  final Playing playing;

  @override
  Widget build(BuildContext context) {
    return AlignPositioned(
        dx: _sequenceAnimation['SongNamePosition'].value.dx,
        dy: _sequenceAnimation['SongNamePosition'].value.dy,
        child: Column(
          children: [
            SizedBox(
                height: (_screenHeight * 0.40),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(),
                      Column(
                        children: [
                          CustomText(
                              text: playing.audio.audio.metas.title!,
                              fontSize:
                                  _sequenceAnimation['SongNameFontSize'].value),
                          CustomText(
                              text: playing.audio.audio.metas.album!,
                              color: Colors.grey),
                        ],
                      ),
                      Opacity(
                        opacity: _sequenceAnimation['SecondAreaOpacity'].value,
                        child: const PositionSeekWidgetBuilder(),
                      ),
                      Opacity(
                        opacity: _sequenceAnimation['SecondAreaOpacity'].value,
                        child: const PlayingControlsBuilder(),
                      ),
                      const SizedBox(height: 45)
                    ])),
          ],
        ));
  }
}
