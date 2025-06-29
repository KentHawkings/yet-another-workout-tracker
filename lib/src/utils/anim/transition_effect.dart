import 'package:flutter/material.dart';
import 'dart:math';

class RippleClipper extends CustomClipper<Path> {
  final String origin;

  final double progress;

  RippleClipper({required this.origin, required this.progress});

  @override
  Path getClip(Size size) {
    Map center = <String, Offset>{
      'Left': Offset(0, size.height),
      'Right': Offset(size.width, size.height),
      'LeftDown': const Offset(0, 0),
      'RightDown': Offset(size.width, 0),
      'Middle': Offset(size.width * .5, size.height * .5),
    };
    Path path = Path();
    double radius = sqrt(pow(size.width, 2) + pow(size.height, 2));
    path.addOval(
        Rect.fromCircle(center: center[origin], radius: radius * progress));
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class TransitionEffect {
  static createFadeIn() {
    return (Curve curve, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child) =>
        FadeTransition(opacity: animation, child: child);
  }

  static createTransfer({
    required Tween<Offset> animationTween,
    required Tween<Offset> secondaryAnimationTween,
    required Tween<double> animationScaleTween,
    required Tween<double> secondaryAnimationScaleTween,
  }) {
    return (Curve curve, Animation<double> animation,
        Animation<double> secondaryAnimation, Widget child) {
      // Go to motion
      Widget secondaryPage = SlideTransition(
        position: secondaryAnimationTween.animate(
          CurvedAnimation(
            parent: secondaryAnimation,
            curve: Interval(0.3, 0.7, curve: curve),
          ),
        ),
        child: ScaleTransition(
          scale: secondaryAnimationScaleTween.animate(
            CurvedAnimation(
              parent: secondaryAnimation,
              curve: Interval(0.0, 0.3, curve: curve),
            ),
          ),
          child: ScaleTransition(
            scale: secondaryAnimationScaleTween.animate(
              CurvedAnimation(
                parent: secondaryAnimation,
                curve: Interval(0.7, 1.0, curve: curve),
              ),
            ),
            child: child,
          ),
        ),
      );

      // Leave the animation
      return SlideTransition(
        position: animationTween.animate(
          CurvedAnimation(
            parent: animation,
            curve: Interval(
              0.3,
              0.7,
              curve: curve,
            ),
          ),
        ),
        child: ScaleTransition(
          scale: animationScaleTween.animate(
            CurvedAnimation(
              parent: animation,
              curve: Interval(
                0.0,
                0.3,
                curve: curve,
              ),
            ),
          ),
          child: ScaleTransition(
            scale: animationScaleTween.animate(
              CurvedAnimation(
                parent: animation,
                curve: Interval(
                  0.7,
                  1.0,
                  curve: curve,
                ),
              ),
            ),
            child: secondaryPage,
          ),
        ),
      );
    };
  }

  static createSlideIn(Tween<Offset> tween) {
    return (Curve curve, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child) =>
        SlideTransition(
          position: tween.animate(
            CurvedAnimation(parent: animation, curve: curve),
          ),
          child: child,
        );
  }

  static createSlide({
    required Tween<Offset> animationTween,
    required Tween<Offset> secondaryAnimationTween,
  }) {
    return (Curve curve, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child) =>
        SlideTransition(
          position: animationTween.animate(animation),
          child: SlideTransition(
            position: secondaryAnimationTween.animate(secondaryAnimation),
            child: child,
          ),
        );
  }

  static createZoomSlide({
    required Tween<Offset> animationTween,
    required Tween<double> secondaryAnimationTween,
  }) {
    return (Curve curve, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child) =>
        SlideTransition(
          position: animationTween.animate(animation),
          child: ScaleTransition(
            scale: secondaryAnimationTween.animate(secondaryAnimation),
            child: child,
          ),
        );
  }

  static createRipple({required String origin}) {
    return (Curve curve, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child) =>
        ClipPath(
          clipper: RippleClipper(origin: origin, progress: animation.value),
          child: child,
        );
  }
}
