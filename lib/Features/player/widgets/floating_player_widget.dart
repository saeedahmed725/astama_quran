import 'dart:ui' as prefix0;

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:astama/Features/player/widgets/playing_controls_button_and_name_area_builder.dart';
import 'package:astama/Features/player/widgets/rounded_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';

import '../../author/view/bloc/author/author_bloc.dart';
import '../../home/view/bloc/home_bloc.dart';
import 'album_cover_area.dart';
import 'minimize_play_pause_button.dart';

class FloatingPlayerWidget extends StatefulWidget {
  const FloatingPlayerWidget({super.key});

  @override
  State<FloatingPlayerWidget> createState() => _FloatingPlayerWidgetState();
}

class _FloatingPlayerWidgetState extends State<FloatingPlayerWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late SequenceAnimation _sequenceAnimation;
  bool _animated = false;
  bool _minimized = true;
  late double _screenWidth, _screenHeight;

  _recursiveZeroCheck(size) {
    if (size > 0) {
      return size;
    } else {
      _recursiveZeroCheck(size);
    }
  }

  @override
  void initState() {
    super.initState();

    _screenWidth =
        _recursiveZeroCheck(MediaQueryData.fromView(prefix0.window).size.width);
    _screenHeight = _recursiveZeroCheck(
        MediaQueryData.fromView(prefix0.window).size.height);

    double roundContainerWidthSize = _screenWidth * 0.93;
    double roundContainerHeightSize = _screenHeight * 0.11;

    Offset roundContainerPosition = Offset(0, ((_screenHeight * 0.40)));
    BorderRadius roundContainerBorderRadius = BorderRadius.circular(100);

    // Song Name
    Offset songNameEndPosition =
        Offset(-(_screenWidth * 0.02), _screenHeight * 0.78);
    Offset songNameStartPosition = Offset(0, _screenHeight * 0.50);
    double songNameStartFontSize = 23;
    double songNameEndFontSize = 18;

    _controller = AnimationController(vsync: this);
    _sequenceAnimation = SequenceAnimationBuilder()
        // RoundContainerWidth
        .addAnimatable(
            animatable: Tween<double>(
              end: _screenWidth,
              begin: roundContainerWidthSize,
            ),
            from: const Duration(milliseconds: 0),
            to: const Duration(milliseconds: 300),
            tag: 'RoundContainerWidth')
        // RoundContainerHeight
        .addAnimatable(
            animatable: Tween<double>(
              end: _screenHeight,
              begin: roundContainerHeightSize,
            ),
            from: const Duration(milliseconds: 0),
            to: const Duration(milliseconds: 300),
            tag: 'RoundContainerHeight')
        // RoundContainerPosition
        .addAnimatable(
            animatable: Tween<Offset>(
              end: const Offset(0, 0),
              begin: roundContainerPosition,
            ),
            from: const Duration(milliseconds: 0),
            to: const Duration(milliseconds: 300),
            tag: 'RoundContainerPosition')
        // RoundContainerBorderRadius
        .addAnimatable(
            animatable: BorderRadiusTween(
              end: BorderRadius.circular(0),
              begin: roundContainerBorderRadius,
            ),
            from: const Duration(milliseconds: 0),
            to: const Duration(milliseconds: 300),
            tag: 'RoundContainerBorderRadius')
        // Album Cover Position
        .addAnimatable(
            animatable: Tween<double>(
              end: -100,
              begin: 400,
            ),
            from: const Duration(milliseconds: 0),
            to: const Duration(milliseconds: 300),
            tag: 'AlbumCoverPosition')
        // Second Area Opacity
        .addAnimatable(
            animatable: Tween<double>(
              end: 1,
              begin: 0,
            ),
            from: const Duration(milliseconds: 0),
            to: const Duration(milliseconds: 100),
            tag: 'SecondAreaOpacity')
        // Song Name Position
        .addAnimatable(
            animatable: Tween<Offset>(
              end: songNameStartPosition,
              begin: songNameEndPosition,
            ),
            from: const Duration(milliseconds: 0),
            to: const Duration(milliseconds: 300),
            tag: 'SongNamePosition')
        // Song Name Font Size
        .addAnimatable(
            animatable: Tween<double>(
              end: songNameStartFontSize,
              begin: songNameEndFontSize,
            ),
            from: const Duration(milliseconds: 0),
            to: const Duration(milliseconds: 300),
            tag: 'SongNameFontSize')
        // Minimize Play/Pause Button Opacity
        .addAnimatable(
            animatable: Tween<double>(
              end: 0,
              begin: 1,
            ),
            from: const Duration(milliseconds: 300),
            to: const Duration(milliseconds: 400),
            tag: 'MinimizeButtonOpacity')
        .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final player =
            context.read<AuthorBloc>().playerController.assetsAudioPlayer;
        return AnimatedBuilder(
            animation: _controller,
            builder: (BuildContext context, Widget? child) {
              return player.builderCurrent(builder: (context, playing) {
                return GestureDetector(
                  onTap: () => setState(() {
                      _minimized = false;
                      if (!_minimized) {
                        _controller.forward();
                      }
                    }),
                  child: Stack(
                    children: [
                      // RoundedContainer
                      RoundedContainer(sequenceAnimation: _sequenceAnimation,minimized: _minimized),
                      // AlbumCoverArea
                      AlbumCoverArea(
                        sequenceAnimation: _sequenceAnimation,
                        screenHeight: _screenHeight,
                        animated: _animated,
                        minimized: _minimized,
                        playing: playing,
                        onPressed: () => setState(() {
                            _minimized = !_minimized;
                            if (!_minimized) {
                              _controller.forward();
                            } else {
                              _controller.reverse();
                            }
                          }),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Stack(
                          children: [
                            PlayingControlsButtonAndNameAreaBuilder(
                              sequenceAnimation: _sequenceAnimation,
                              screenHeight: _screenHeight,
                              playing: playing,
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: _minimized ? 0.037.sh : 0),
                              child: MinimizePlayPauseButton(
                                screenWidth: _screenWidth,
                                screenHeight: _screenHeight,
                                sequenceAnimation: _sequenceAnimation,
                                onPressed: () => setState(() {
                                  _animated = _minimized ? false : !_animated;
                                }),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              });
            });
      },
    );
  }
}
