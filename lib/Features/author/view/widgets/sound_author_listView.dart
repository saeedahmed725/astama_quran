import 'package:astama/Features/author/domain/entity/reciter_entity.dart';
import 'package:astama/Features/home/view/widgets/play_button.dart';
import 'package:astama/core/shared/custom_text.dart';
import 'package:astama/core/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:redacted/redacted.dart';

import '../../../../core/shared/sound_card_info.dart';
import '../../../home/view/widgets/title_bar.dart';
import '../../../player/screens/player.dart';
import '../bloc/LeastListening/least_listening_bloc.dart';
import '../bloc/author/author_bloc.dart';
import '../bloc/percent/percent_bloc.dart';
import 'download_button.dart';

class SoundAuthorListView extends StatelessWidget {
  const SoundAuthorListView({
    super.key,
    this.reciters,
    this.onTap,
  });

  final List<ReciterEntity>? reciters;
  final Function(int index)? onTap;

  @override
  Widget build(BuildContext context) {
    int current = -1;
    if (context.read<AuthorBloc>().playerController.assetsAudioPlayer.current.hasValue) {
      current = context.read<AuthorBloc>().playerController.assetsAudioPlayer.current.value?.index ?? -1;
    }
    return BlocProvider(
      create: (context) => PercentBloc(),
      child: BlocBuilder<AuthorBloc, AuthorState>(
        builder: (context, state) {
          if (reciters != null) {
            if (reciters!.isNotEmpty) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: reciters!.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      if (reciters![index].rowya.keys.first == 0)
                        TitleBar(text: reciters![index].rowya.values.first),
                      SoundCardInfo(
                        index: index,
                        name: reciters![index].surahName,
                        rowyaName: reciters![index].rowya.values.first,
                        imagePath: reciters![index].image,
                        onTap: () {
                          context.read<LeastListeningBloc>().add(SetLeastListeningSurahEvent(index));
                          context.read<LeastListeningBloc>().add(GetLeastListeningReciterEvent());
                          onTap!(index);
                          context.nextPage(const PlayerScreen());
                        },
                        child: reciters![index].isDownloaded
                            ? PlayButton(
                                index: index,
                                child: current == index
                                    ? const Icon(Icons.pause_rounded,
                                        color: Colors.white)
                                    : const Icon(Icons.play_arrow_rounded,
                                        color: Colors.white),
                              )
                            : DownloadButton(
                                onTap: () => context
                                    .read<AuthorBloc>()
                                    .add(DownloadingPlayList(index, context)),
                              ),
                      ),
                    ],
                  );
                },
              );
            } else {
              return const SizedBox(
                height: 200,
                child: Center(
                  child: CustomText(text: 'لا يوجد تنزيلات', fontSize: 18),
                ),
              );
            }
          } else {
            return SingleChildScrollView(
                child: Container(
              height: 400,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20)),
              child: const SizedBox(),
            ).redacted(
                    context: context,
                    redact: true,
                    configuration: RedactedConfiguration(
                      animationDuration: const Duration(milliseconds: 300),
                    )));
          }
        },
      ),
    );
  }
}
