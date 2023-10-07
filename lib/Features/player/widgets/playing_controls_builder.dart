import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../author/view/bloc/author/author_bloc.dart';
import 'PlayingControls.dart';

class PlayingControlsBuilder extends StatelessWidget {
  const PlayingControlsBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    final player = context.read<AuthorBloc>().playerController.assetsAudioPlayer;
    return player.builderLoopMode(
      builder: (context, loopMode) {
        return PlayerBuilder.isPlaying(
            player: player,
            builder: (context, isPlaying) {
              return PlayingControls(
                loopMode: loopMode,
                isPlaying: isPlaying,
                isPlaylist: true,
                onStop: () => player.stop(),
                toggleLoop: () => player.toggleLoop(),
                onPlay: () => player.playOrPause(),
                onNext: () => player.next(keepLoopMode: true),
                onPrevious: () => player.previous(/*keepLoopMode: false*/),
              );
            });
      },
    );
  }
}