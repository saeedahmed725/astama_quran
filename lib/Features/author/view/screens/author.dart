import 'package:astama/core/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../core/bloc/theme/theme_bloc.dart';
import '../../../../core/constants/app_assets_image.dart';
import '../../../../core/shared/custom_appbar.dart';
import '../../../home/data/model/api/reciters_model.dart';
import '../../../player/widgets/floating_player_widget.dart';
import '../bloc/author/author_bloc.dart';
import '../widgets/author_sliver_list.dart';

class AuthorScreen extends StatelessWidget {
  const AuthorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final data = (context.read<AuthorBloc>().reciterData =
        ModalRoute.of(context)?.settings.arguments as ReciterModel);
    return Scaffold(
      appBar: CustomAppBar(
        title: data.name,
        actions: [
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 20.0),
            child: IconButton(
              onPressed: context.back,
              highlightColor: Colors.transparent,
              icon: BlocBuilder<ThemeBloc, ThemeState>(
                builder: (context, state) {
                  if (state is LoadedThemeState) {
                    return SvgPicture.asset(AppAssetsImage.arrowBackImage,
                        color: state.themeValue
                            ? Colors.white
                            : Colors.black,
                        height: 14);
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          )
        ],
      ),
      body: const Stack(
        children: [
          AuthorSliverList(),
          FloatingPlayerWidget(),
        ],
      ),
    );
  }
}
