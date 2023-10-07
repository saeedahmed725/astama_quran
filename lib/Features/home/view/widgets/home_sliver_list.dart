import 'package:astama/Features/home/view/widgets/souncard_info_list_view.dart';
import 'package:astama/Features/home/view/widgets/title_bar.dart';
import 'package:flutter/material.dart';

import 'custom_search_widget.dart';
import 'least_listening_builder.dart';

class HomeSliverList extends StatelessWidget {
  const HomeSliverList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ListView(
        children: const [
          CustomSearchWidget(),
          LeastListeningBuilder(),
          TitleBar(text: 'افضل الصوتيات'),
          SoundCardInfoListViewBuilder()
        ],
      ),
    );
  }
}
