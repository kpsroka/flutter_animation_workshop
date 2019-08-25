import 'package:flutter/material.dart';
import 'package:flutter_animation_workshop/hero_rect_tween.dart';
import 'package:flutter_animation_workshop/star_fab.dart';

import 'image_card.dart';
import 'image_data.dart';

class Zoom extends StatelessWidget {
  final ImageData imageData;
  final bool starred;

  const Zoom({Key key, @required this.imageData, @required this.starred})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(imageData.title)),
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: Hero(
              createRectTween: (Rect start, Rect end) =>
                  HeroRectTween(start, end),
              tag: imageData.filename,
              child: ImageCard(filename: imageData.filename, starred: starred),
            ),
          ),
          Positioned(
            bottom: 24,
            left: 0,
            right: 0,
            child: Center(child: StarFab(starred, heroTag: imageData.title)),
          ),
        ],
      ),
    );
  }
}
