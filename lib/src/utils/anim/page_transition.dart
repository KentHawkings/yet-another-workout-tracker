import 'package:flutter/material.dart';
import 'package:yet_another_fitness_tracker/src/utils/anim/page_transition_type.dart';
import 'package:yet_another_fitness_tracker/src/utils/anim/transition_effect.dart';
import 'package:yet_another_fitness_tracker/src/utils/anim/transition_tween.dart';

final Map _effectMap = <PageTransitionType, void>{
  PageTransitionType.fadeIn: TransitionEffect.createFadeIn(),
  PageTransitionType.transferRight: TransitionEffect.createTransfer(
    animationTween: t1,
    secondaryAnimationTween: t5,
    animationScaleTween: t14,
    secondaryAnimationScaleTween: t13,
  ),
  PageTransitionType.transferUp: TransitionEffect.createTransfer(
    animationTween: t3,
    secondaryAnimationTween: t7,
    animationScaleTween: t14,
    secondaryAnimationScaleTween: t13,
  ),
  PageTransitionType.slideInLeft: TransitionEffect.createSlideIn(t1),
  PageTransitionType.slideInRight: TransitionEffect.createSlideIn(t2),
  PageTransitionType.slideInUp: TransitionEffect.createSlideIn(t3),
  PageTransitionType.slideInDown: TransitionEffect.createSlideIn(t4),
  PageTransitionType.slideLeft: TransitionEffect.createSlide(
    animationTween: t1,
    secondaryAnimationTween: t5,
  ),
  PageTransitionType.slideRight: TransitionEffect.createSlide(
    animationTween: t2,
    secondaryAnimationTween: t6,
  ),
  PageTransitionType.slideUp: TransitionEffect.createSlide(
    animationTween: t3,
    secondaryAnimationTween: t7,
  ),
  PageTransitionType.slideDown: TransitionEffect.createSlide(
    animationTween: t4,
    secondaryAnimationTween: t8,
  ),
  PageTransitionType.slideParallaxLeft: TransitionEffect.createSlide(
    animationTween: t1,
    secondaryAnimationTween: t9,
  ),
  PageTransitionType.slideParallaxRight: TransitionEffect.createSlide(
    animationTween: t2,
    secondaryAnimationTween: t10,
  ),
  PageTransitionType.slideParallaxUp: TransitionEffect.createSlide(
    animationTween: t3,
    secondaryAnimationTween: t11,
  ),
  PageTransitionType.slideParallaxDown: TransitionEffect.createSlide(
    animationTween: t4,
    secondaryAnimationTween: t12,
  ),
  PageTransitionType.slideZoomLeft: TransitionEffect.createZoomSlide(
    animationTween: t1,
    secondaryAnimationTween: t13,
  ),
  PageTransitionType.slideZoomRight: TransitionEffect.createZoomSlide(
    animationTween: t2,
    secondaryAnimationTween: t13,
  ),
  PageTransitionType.slideZoomUp: TransitionEffect.createZoomSlide(
    animationTween: t3,
    secondaryAnimationTween: t13,
  ),
  PageTransitionType.slideZoomDown: TransitionEffect.createZoomSlide(
    animationTween: t4,
    secondaryAnimationTween: t13,
  ),
  PageTransitionType.rippleRightUp: TransitionEffect.createRipple(
    origin: 'Right',
  ),
  PageTransitionType.rippleLeftUp: TransitionEffect.createRipple(
    origin: 'Left',
  ),
  PageTransitionType.rippleLeftDown: TransitionEffect.createRipple(
    origin: 'LeftDown',
  ),
  PageTransitionType.rippleRightDown: TransitionEffect.createRipple(
    origin: 'RightDown',
  ),
  PageTransitionType.rippleMiddle: TransitionEffect.createRipple(
    origin: 'Middle',
  ),
};

class PageTransition extends PageRouteBuilder {
  final Widget child;
  final PageTransitionType type;
  final Curve curve;
  final Duration duration;

  PageTransition({
    required this.child,
    required this.type,
    this.curve = Curves.linear,
    this.duration = Durations.medium2,
  }) : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return child;
          },
          transitionDuration: duration,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            return _effectMap[type](
                curve, animation, secondaryAnimation, child);
          },
        );
}
