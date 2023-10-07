import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:astama/Features/player/widgets/playing_controls_builder.dart';
import 'package:astama/Features/player/widgets/position_seek_widget_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_assets_image.dart';
import '../../../core/shared/custom_text.dart';
import '../../author/view/bloc/author/author_bloc.dart';

class PlayerSliverList extends StatelessWidget {
  const PlayerSliverList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildListDelegate([
      context.read<AuthorBloc>().playerController.assetsAudioPlayer.builderCurrent(builder: (context, playing) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 280.h,
              width: 1.sw,
              color: Colors.transparent,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                    playing.audio.audio.metas.image?.path ??
                        AppAssetsImage.alafasyImage,
                    fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 15),
            CustomText(text: playing.audio.audio.metas.title!, fontSize: 26),
            CustomText(
                text: playing.audio.audio.metas.album!, color: Colors.grey),
            const SizedBox(height: 25),
            const PositionSeekWidgetBuilder(),
            const SizedBox(height: 40),
            const PlayingControlsBuilder(),
          ],
        );
      })
    ]));
  }
}
