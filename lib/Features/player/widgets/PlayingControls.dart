import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:astama/core/constants/app_color.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../../../core/utils/function.dart';

class PlayingControls extends StatelessWidget {
  final bool isPlaying;
  final LoopMode? loopMode;
  final bool isPlaylist;
  final Function()? onPrevious;
  final Function() onPlay;
  final Function()? onNext;
  final Function()? toggleLoop;
  final Function()? onStop;

  const PlayingControls({
    super.key,
    required this.isPlaying,
    this.isPlaylist = false,
    this.loopMode,
    this.toggleLoop,
    this.onPrevious,
    required this.onPlay,
    this.onNext,
    this.onStop,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColor.kPrimaryColor,
              ),
              child: IconButton(
                padding: const EdgeInsets.all(18),
                onPressed: isPlaylist ? onPrevious : null,
                icon: const Icon(Icons.skip_previous_rounded,
                    color: Colors.white),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColor.kPrimaryColor,
              ),
              child: IconButton(
                padding: const EdgeInsets.all(24),
                onPressed: onPlay,
                icon: Icon(
                  isPlaying ? Icons.pause : Icons.play_arrow,
                  size: 32,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColor.kPrimaryColor,
              ),
              child: IconButton(
                padding: const EdgeInsets.all(18),
                onPressed: isPlaylist ? onNext : null,
                icon: const Icon(Icons.skip_next_rounded, color: Colors.white),
              ),
            ),
            const Spacer(),
          ],
        ),
        const SizedBox(height: 30),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                if (toggleLoop != null) toggleLoop!();
              },
              child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: AppColor.kPrimaryColor,
                      borderRadius: BorderRadius.circular(100)),
                  child: loopIcon(loopMode!)),
            ),
            const Spacer(),
            if (onStop != null)
              GestureDetector(
                onTap: onStop,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: AppColor.kPrimaryColor,
                      borderRadius: BorderRadius.circular(100)),
                  child: const Icon(
                    color: Colors.white,
                    Icons.stop,
                    size: 30,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
