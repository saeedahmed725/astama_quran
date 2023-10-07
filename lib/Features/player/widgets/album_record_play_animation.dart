import 'dart:ui';

import 'package:align_positioned/align_positioned.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:astama/core/constants/app_assets_image.dart';
import 'package:flutter/material.dart';

class AlbumRecordPlayAnimation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AlbumRecordPlayAnimationState();
  final bool animated;
  final bool minimized;
  final Playing playing;

  const AlbumRecordPlayAnimation(
      {super.key,
      required this.animated,
      required this.minimized,
      required this.playing});
}

class _AlbumRecordPlayAnimationState extends State<AlbumRecordPlayAnimation>
    with TickerProviderStateMixin {
  late AnimationController
      _albumAndVinylController,
      _minimizedController;
  late Animation _albumAnimation, _minimizedAnimation, _borderRadiusAnimation;

  @override
  void initState() {
    super.initState();
    double screenHeight = MediaQueryData.fromView(window).size.height;
    double roundContainerHeightSize = screenHeight * 0.095;
    double albumCoverHeightSize = (roundContainerHeightSize * 0.999);

    _minimizedController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    // Animation Controller
    _albumAndVinylController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _albumAnimation = AlignmentTween(
            begin: const Alignment(0.0, 0.0), end: const Alignment(-0.5, 0.0))
        .animate(
      CurvedAnimation(
          parent: _albumAndVinylController, curve: Curves.easeOutQuad),
    )..addListener(() => setState(() {}));
    _minimizedAnimation = Tween<double>(end: 216, begin: albumCoverHeightSize -15)
        .animate(CurvedAnimation(
            parent: _minimizedController,
            curve: Curves.decelerate)) // Curves.decelerate
      ..addListener(() => setState(() {}));
    _borderRadiusAnimation = BorderRadiusTween(
            end: BorderRadius.circular(10.0),
            begin: BorderRadius.circular(100.0))
        .animate(_minimizedController)
      ..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _minimizedController.dispose();
    _albumAndVinylController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidthSize = MediaQuery.of(context).size.width;
    double relativeSize = (screenWidthSize * 3) / 5;
    if (!widget.minimized) {
      _minimizedController.forward();
    } else {
      _minimizedController.reverse();
    }
    return SizedBox(
      width: screenWidthSize,
      height: (relativeSize + 70),
      child: AlignPositioned(
        alignment: widget.minimized
            ? const Alignment(0.0, 0.0)
            : _albumAnimation.value,
        child: Container(
          margin: const EdgeInsets.only(top: 20),
          width: _minimizedAnimation.value + (widget.minimized ? 0 : 70),
          height: _minimizedAnimation.value + (widget.minimized ? 0 : 70),
          decoration: BoxDecoration(
            borderRadius: _borderRadiusAnimation.value,
            boxShadow: [
              widget.minimized
                  ? const BoxShadow()
                  : BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      offset: const Offset(-10, 10),
                      blurRadius: 12,
                      spreadRadius: 1.0,
                    ),
            ],
            image: DecorationImage(
              image: AssetImage(widget.playing.audio.audio.metas.image?.path ??
                  AppAssetsImage.alafasyImage),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
