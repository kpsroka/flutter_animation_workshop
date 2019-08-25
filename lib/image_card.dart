import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final bool starred;
  final String filename;

  const ImageCard({Key key, this.starred, this.filename}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      clipBehavior: Clip.hardEdge,
      child: ShaderMask(
        shaderCallback: (Rect bounds) => RadialGradient(
          radius: starred ? 0 : 1000,
          center: Alignment.centerLeft,
          colors: <Color>[Colors.grey.shade700, Colors.white],
          tileMode: TileMode.clamp,
        ).createShader(bounds),
        child: OverflowBox(
          maxHeight: double.maxFinite,
          child: Image.asset('assets/images/$filename'),
        ),
      ),
    );
  }
}
