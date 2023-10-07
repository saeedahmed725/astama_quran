import 'package:astama/Features/author/view/widgets/shihk_image_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:redacted/redacted.dart';

import '../../domain/entity/reciter_entity.dart';
import '../bloc/author/author_bloc.dart';

class ShihkImagePreviewBuilder extends StatelessWidget {
  const ShihkImagePreviewBuilder({
    super.key,
    required this.reciterEntity,
  });

  final List<ReciterEntity> reciterEntity;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthorBloc, AuthorState>(
      builder: (context, state) {
        if (state is LoadingPlayListReciterSuccess ||
            state is DownloadedPlayListReciterSuccess ||
            state is PlayedRemoteAudioSuccess ||
            state is PlayedLocalAudioSuccess) {
          return ShihkImagePreview(image: reciterEntity.first.image);
        } else {
          return const ShihkImagePreview().redacted(
              context: context,
              redact: true,
              configuration: RedactedConfiguration(
                animationDuration: const Duration(milliseconds: 300),
              ));
        }
      },
    );
  }
}