import 'package:flutter/material.dart';

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
      body: Center(child: Image.asset('assets/images/${imageData.filename}')),
    );
  }
}
