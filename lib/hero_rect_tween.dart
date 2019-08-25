import 'package:flutter/widgets.dart';

class HeroRectTween extends Tween<Rect> {
  HeroRectTween(Rect begin, Rect end) : super(begin: begin, end: end);

  @override
  Rect evaluate(Animation<double> animation) {
    return Rect.lerp(begin, end, Curves.fastOutSlowIn.transform(animation.value));
  }
}
