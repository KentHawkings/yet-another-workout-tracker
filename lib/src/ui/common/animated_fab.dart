import 'package:flutter/material.dart';

class AnimatedFAB extends StatefulWidget {
  const AnimatedFAB({
    super.key,
    required this.child,
    required this.onPressed,
    required this.isVisible,
    this.tooltip,
  });

  final Widget child;
  final Function() onPressed;
  final String? tooltip;
  final bool isVisible;

  @override
  AnimatedFABState createState() => AnimatedFABState();
}

class AnimatedFABState extends State<AnimatedFAB>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Durations.short4,
      vsync: this,
    );
    animation = CurvedAnimation(parent: controller, curve: Curves.easeInBack);
    onPressed = widget.onPressed;
    child = widget.child;
    tooltip = widget.tooltip;
    isVisible = widget.isVisible;
  }

  late Animation<double> animation;
  late AnimationController controller;
  late Function() onPressed;
  late Widget child;
  late String? tooltip;
  late bool isVisible;

  @override
  void didUpdateWidget(AnimatedFAB oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.child != child || widget.isVisible != isVisible) {
      controller.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            child = widget.child;
            isVisible = widget.isVisible;
          });
        }
      });
      controller.animateTo(widget.isVisible ? 0 : 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return _FABTransition(
      animation: animation,
      child: FloatingActionButton(
        tooltip: tooltip,
        onPressed: onPressed,
        child: child,
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class _FABTransition extends AnimatedWidget {
  const _FABTransition({
    required this.animation,
    required this.child,
  }) : super(listenable: animation);

  final Animation<double> animation;
  final Widget child;

  static final opacityTween = Tween<double>(begin: 1, end: 0);
  static final sizeTween = Tween<double>(begin: 1, end: 0);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Opacity(
      opacity: opacityTween.evaluate(animation).clamp(0.0, 1.0),
      child: Transform.scale(
        scale: sizeTween.evaluate(animation),
        alignment: Alignment.center,
        child: child,
      ),
    );
  }
}
