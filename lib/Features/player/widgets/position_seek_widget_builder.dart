import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../author/view/bloc/author/author_bloc.dart';
import 'PositionSeekWidget.dart';

class PositionSeekWidgetBuilder extends StatelessWidget {
  const PositionSeekWidgetBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final player = context.read<AuthorBloc>().playerController.assetsAudioPlayer;
    return player.builderRealtimePlayingInfos(
      builder: (context, RealtimePlayingInfos? info) {
        return Column(
          children: [
            PositionSeekWidget(
              currentPosition: info?.currentPosition ?? const Duration(seconds: 1),
              duration: info?.duration ?? const Duration(seconds: 1000),
              seekTo: (to) {
                player.seek(to);
              },
            ),
          ],
        );
      },
    );
  }
}
