import 'package:flutter/material.dart';
import '../widgets/player_silver_appbar.dart';
import '../widgets/player_silver_list.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: CustomScrollView(
            slivers: [
              PlayerSliverAppbar(),
              PlayerSliverList(),
            ],
          ),
        ),
      ),
    );
  }
}
