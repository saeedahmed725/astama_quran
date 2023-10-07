import 'package:flutter/material.dart';
import '../../../../core/shared/custom_appbar.dart';
import '../../../player/widgets/floating_player_widget.dart';
import '../widgets/home_sliver_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'الرئيسية'),
      body: Stack(
        children: [HomeSliverList(), FloatingPlayerWidget()],
      ),
    );
  }
}
