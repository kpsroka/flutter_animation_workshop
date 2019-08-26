import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_animation_workshop/star_fab.dart';

import 'image_data.dart';

class Zoom extends StatefulWidget {
  final ImageData imageData;
  final bool starred;

  const Zoom({Key key, @required this.imageData, @required this.starred})
      : super(key: key);

  @override
  _ZoomState createState() => _ZoomState();
}

class _ZoomState extends State<Zoom> with SingleTickerProviderStateMixin {
  double _dragOffset = 0;
  double _dragFactor = 1;
  AnimationController _paneController;

  @override
  void initState() {
    super.initState();
    _paneController = AnimationController(vsync: this);
    _paneController.addListener(() {
      if (mounted) {
        setState(() {
          _dragOffset = (1 - _paneController.value) * _dragFactor;
        });
      }
    });
  }

  @override
  dispose() {
    _paneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('offset is $_dragOffset');

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(widget.imageData.title)),
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
              child: GestureDetector(
            onHorizontalDragStart: _onDragStart,
            onHorizontalDragUpdate: _onDragUpdate,
            onHorizontalDragEnd: _onDragEnd,
            child: Transform.translate(
              offset: Offset(_dragOffset, 0),
              child: Image.asset('assets/images/${widget.imageData.filename}'),
            ),
          )),
          Positioned(
            bottom: 24,
            left: 0,
            right: 0,
            child: Center(child: StarFab(widget.starred)),
          ),
        ],
      ),
    );
  }

  void _onDragStart(DragStartDetails details) {
    debugPrint('drag start: $details');
    _paneController.stop();
  }

  void _onDragUpdate(DragUpdateDetails details) {
    debugPrint('drag update: $details');
    setState(() {
      _dragOffset += details.primaryDelta;
    });
  }

  void _onDragEnd(DragEndDetails details) {
    debugPrint('drag end: $details');
    _dragFactor = _dragOffset;
    _paneController
        .animateWith(GravitySimulation(0.1, 0, _dragOffset.abs(), 0))
        .whenComplete(() {
      _paneController.stop();
    });
  }
}
