import 'package:flutter/material.dart';

class StarFab extends StatelessWidget {
  final bool value;
  final VoidCallback onPressed;
  final String heroTag;

  const StarFab(this.value, {Key key, this.onPressed, this.heroTag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: heroTag,
      backgroundColor:
          value ? Colors.yellow.withAlpha(191) : Colors.white.withAlpha(127),
      onPressed: () {
        if (onPressed != null) onPressed();
      },
      child: Icon(
        value ? Icons.star : Icons.star_border,
        size: 48,
        color: Colors.white,
      ),
    );
  }
}
