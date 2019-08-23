import 'package:flutter/material.dart';

class StarFab extends StatefulWidget {
  const StarFab({Key key}) : super(key: key);

  @override
  _StarFabState createState() => _StarFabState();
}

class _StarFabState extends State<StarFab> {
  bool starred = false;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: null,
      backgroundColor: starred ? Colors.yellow.withAlpha(191) : Colors.white.withAlpha(127),
      onPressed: () {
        setState(() {
          starred = !starred;
        });
      },
      child: Icon(
        starred ? Icons.star : Icons.star_border,
        size: 48,
        color: Colors.white,
      ),
    );
  }
}
