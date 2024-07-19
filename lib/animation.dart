import 'package:flutter/material.dart';
import 'package:simple_animations/animation_builder/play_animation_builder.dart';
import 'package:simple_animations/movie_tween/movie_tween.dart';

class CustumAnimation extends StatelessWidget {
  final Widget child;
  final double duration;
  const CustumAnimation(this.duration, this.child);

  @override
  Widget build(BuildContext context) {
    final tween = MovieTween()
      ..tween('opacity', Tween(begin: 0.0, end: 1.0),
              duration: const Duration(milliseconds: 300))
          .thenTween('x', Tween(begin: 30.0, end: 0.0),
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut);

    return PlayAnimationBuilder<Movie>(
      delay: Duration(milliseconds: (300 * duration).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (context, value, child) => Opacity(
        opacity: value.get("opacity"),
        child: Transform.translate(
            offset: Offset(value.get("x"),0), child: child),
      ),
    );
  }
}
