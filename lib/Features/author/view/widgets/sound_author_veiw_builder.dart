import 'package:astama/Features/author/view/widgets/sound_author_listView.dart';
import 'package:astama/core/utils/extension.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:redacted/redacted.dart';

import '../../../player/screens/player.dart';
import '../../domain/entity/reciter_entity.dart';
import '../bloc/author/author_bloc.dart';

class SoundAuthorListViewBuilder extends StatelessWidget {
  const SoundAuthorListViewBuilder({
    super.key,
    required this.reciterEntity,
  });

  final List<ReciterEntity> reciterEntity;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthorBloc, AuthorState>(
      listener: (context, state) {
        if (state is DownloadingAudioFailure) {
          BotToast.showText(
              text: state.failure.errMessage,
              duration: const Duration(seconds: 4));
        }
      },
      builder: (context, state) {
        if (state is LoadingPlayListReciterSuccess ||
            state is DownloadedPlayListReciterSuccess ||
            state is PlayedLocalAudioSuccess ||
            state is PlayedRemoteAudioSuccess) {
          if (state is LoadingPlayListReciterSuccess) {
            debugPrint(
                'LoadingPlayListReciterSuccess: ${state.allReciters.length} ${state.allReciters}');
            return SoundAuthorListView(
              reciters: state.allReciters,
              onTap: (index) => context.read<AuthorBloc>().add(PlayRemoteAudio(index)),
            );
          }
          if (state is DownloadedPlayListReciterSuccess) {
            debugPrint(
                'DownloadedPlayListReciterSuccess: ${state.downloadedReciters.length} ${state.downloadedReciters}');
            return SoundAuthorListView(
              reciters: state.downloadedReciters,
              onTap: (index) => context.read<AuthorBloc>().add(PlayLocalAudio(index)),
            );
          }
          if (state is PlayedLocalAudioSuccess) {
            return SoundAuthorListView(
              reciters: reciterEntity,
              onTap: (int index) {
                context.read<AuthorBloc>().add(PlayLocalAudio(index));
                context.nextPage(const PlayerScreen());
              },
            );
          }
          if (state is PlayedRemoteAudioSuccess) {
            return SoundAuthorListView(
              reciters: reciterEntity,
              onTap: (int index) => context.read<AuthorBloc>().add(PlayRemoteAudio(index)),
            );
          } else {
            return SoundAuthorListView(
              reciters: reciterEntity,
              onTap: (int index) => context.read<AuthorBloc>().add(PlayLocalAudio(index)),
            );
          }
        } else {
          return const SoundAuthorListView().redacted(
            context: context,
            redact: true,
            configuration: RedactedConfiguration(
              animationDuration: const Duration(milliseconds: 300),
            ),
          );
        }
      },
    );
  }
}
