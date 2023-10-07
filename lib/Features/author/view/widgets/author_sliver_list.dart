import 'package:astama/Features/author/domain/entity/reciter_entity.dart';
import 'package:astama/Features/author/view/widgets/shihk_image_preview_builder.dart';
import 'package:astama/Features/author/view/widgets/sound_author_veiw_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/author/author_bloc.dart';
import 'nav_bat.dart';

class AuthorSliverList extends StatefulWidget {
  const AuthorSliverList({super.key});

  @override
  State<AuthorSliverList> createState() => _AuthorSliverListState();
}

class _AuthorSliverListState extends State<AuthorSliverList> {
  @override
  void initState() {
    super.initState();
    context.read<AuthorBloc>().add(InitPlayListReciter());
    context.read<AuthorBloc>().add(LoadingPlayListReciter());
  }

  @override
  Widget build(BuildContext context) {
    List<ReciterEntity> reciterEntity = context.read<AuthorBloc>().allReciters;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ListView(
        children: [
          ShihkImagePreviewBuilder(reciterEntity: reciterEntity),
          const NavBar(),
          SoundAuthorListViewBuilder(reciterEntity: reciterEntity),
        ],
      ),
    );
  }
}
