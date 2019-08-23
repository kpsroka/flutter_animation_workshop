import 'package:flutter/material.dart';
import 'package:flutter_animation_workshop/star_fab.dart';

import 'image_data.dart';

class Zoom extends StatelessWidget {
  final ImageData imageData;

  const Zoom({Key key, @required this.imageData}) : super(key: key);

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
          Center(child: Image.asset('assets/images/${imageData.filename}')),
          Positioned(
            bottom: 24,
            left: 0,
            right: 0,
            child: Center(child: StarFab()),
          ),
        ],
      ),
    );
  }
}
