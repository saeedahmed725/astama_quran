import 'package:astama/Features/author/view/bloc/LeastListening/least_listening_bloc.dart';
import 'package:astama/core/shared/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../core/constants/app_assets_image.dart';
import '../../../../core/shared/sound_card_info.dart';
import '../../data/model/api/reciters_model.dart';
import '../bloc/home_bloc.dart';
import 'play_button.dart';

class SoundCardInfoListViewBuilder extends StatelessWidget {
  const SoundCardInfoListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is LoadingReciterListSuccess) {
          return SoundCardInfoListView(reciterList: state.reciterList);
        } else if (state is SearchReciterListSuccess) {
          return SoundCardInfoListView(reciterList: state.reciterList);
        } else {
          return Container();
        }
      },
    );
  }
}

class SoundCardInfoListView extends StatelessWidget {
  const SoundCardInfoListView({
    super.key,
    required this.reciterList,
  });

  final List<ReciterModel> reciterList;

  @override
  Widget build(BuildContext context) {
    if (reciterList.isNotEmpty) {
      return ListView.builder(
        itemCount: reciterList.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => SoundCardInfo(
          name: reciterList[index].name,
          rowyaName: reciterList[index].moshaf.first.name,
          imagePath: reciterList[index].image,
          onTap: () {
            context.read<LeastListeningBloc>().add(SetLeastListeningReciterEvent(index));
            context.read<HomeBloc>().add(GotToAuthorPage(context, index));
          },
          child: PlayButton(
              index: index,
              child: context.read<HomeBloc>().playedIndex == index
                  ? const Icon(Icons.pause_rounded, color: Colors.white)
                  : SvgPicture.asset(AppAssetsImage.playFilledImage,
                      height: 15)),
        ),
      );
    } else {
      return SizedBox(
        height: 0.25.sh,
        child: const Center(
          child: CustomText(
            text: 'غير متوافر',
            fontSize: 18,
          ),
        ),
      );
    }
    ;
  }
}
