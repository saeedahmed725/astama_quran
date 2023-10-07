import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_assets_image.dart';
import '../../../../core/shared/custom_text.dart';
import '../../../../core/shared/frosted_glass_effect.dart';
import '../../../author/view/bloc/LeastListening/least_listening_bloc.dart';
import '../../../author/view/bloc/author/author_bloc.dart';
import '../bloc/home_bloc.dart';

class LeastListening extends StatefulWidget {
  const LeastListening(
      {super.key, required this.loadingState, required this.state});

  final LoadingReciterListSuccess loadingState;
  final GetLeastListeningReciterState state;

  @override
  State<LeastListening> createState() => _LeastListeningState();
}

class _LeastListeningState extends State<LeastListening> {
  void getLastLeastListeningReciter(
      {required AuthorBloc authorBloc, required HomeBloc homeBloc}) {
    authorBloc.reciterData = homeBloc.recitersList[widget.state.reciter!];
    authorBloc.add(LoadingPlayListReciter());
    authorBloc.add(PlayRemoteAudio(widget.state.surah!));
  }

  @override
  Widget build(BuildContext context) {
    final authorBloc = context.read<AuthorBloc>();
    final homeBloc = context.read<HomeBloc>();
    return GestureDetector(
      onTap: () => getLastLeastListeningReciter(
          authorBloc: authorBloc, homeBloc: homeBloc),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(text: "أخر ما تم الأستماع إليه", fontSize: 18),
          SizedBox(height: 20.h),
          Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Container(
                height: 220.h,
                width: double.infinity,
                color: Colors.transparent,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                      widget.loadingState.reciterList[widget.state.reciter!]
                              .image ??
                          AppAssetsImage.alafasyImage,
                      fit: BoxFit.cover),
                ),
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  const FrostedGlassEffect(),
                  Column(
                    children: [
                      CustomText(
                          text: widget.loadingState
                              .reciterList[widget.state.reciter!].name,
                          color: Colors.white,
                          fontSize: 18.sp),
                      CustomText(
                          text: widget
                              .loadingState
                              .reciterList[widget.state.reciter!]
                              .moshaf
                              .first
                              .name,
                          color: Colors.white)
                    ],
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
