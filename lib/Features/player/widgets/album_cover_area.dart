import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';

import 'album_record_play_animation.dart';

class AlbumCoverArea extends StatelessWidget {
  const AlbumCoverArea({
    super.key,
    required SequenceAnimation sequenceAnimation,
    required double screenHeight,
    required bool animated,
    required bool minimized,
    required this.playing,
    this.onPressed,
  })  : _sequenceAnimation = sequenceAnimation,
        _screenHeight = screenHeight,
        _animated = animated,
        _minimized = minimized;

  final SequenceAnimation _sequenceAnimation;
  final double _screenHeight;
  final bool _animated;
  final bool _minimized;
  final Playing playing;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: ((_sequenceAnimation['AlbumCoverPosition'].value + 100) * -0.245),
      bottom: ((MediaQuery.sizeOf(context).height.toDouble() * 0.312) -
          _sequenceAnimation['AlbumCoverPosition'].value),
      child: Padding(
        padding: EdgeInsets.only(bottom: _minimized ? 0.017.sh : 0),
        child: Column(
          children: [
            SizedBox(
              height: (_screenHeight * 0.50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _minimized
                      ? const SizedBox()
                      : AnimatedOpacity(
                          opacity: _minimized ? 0.0 : 1.0,
                          duration: const Duration(seconds: 500),
                          child: IconButton(
                              iconSize: 30,
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                              ),
                              onPressed: onPressed),
                        ),
                  AlbumRecordPlayAnimation(
                    animated: _animated,
                    minimized: _minimized,
                    playing: playing,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
