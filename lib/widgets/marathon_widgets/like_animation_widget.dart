import 'package:flutter/material.dart';

class LikeAnimationWidget extends StatefulWidget {
  final Widget child;
  final bool isAnimated;
  final Duration duration;
  final VoidCallback onEnd;
  const LikeAnimationWidget({
    Key? key,
    required this.child,
    required this.isAnimated,
    required this.duration,
    required this.onEnd,
  }) : super(key: key);

  @override
  State<LikeAnimationWidget> createState() => _LikeAnimationWidgetState();
}

class _LikeAnimationWidgetState extends State<LikeAnimationWidget>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> scale;
  @override
  void initState() {
    super.initState();
    final halfDuration = widget.duration.inMilliseconds ~/ 2;
    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: halfDuration));
    scale = Tween<double>(begin: 1, end: 1.2).animate(animationController);
  }

  @override
  void didUpdateWidget(covariant LikeAnimationWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isAnimated != oldWidget.isAnimated) {
      startAnimation();
    }
  }

  Future<void> startAnimation() async {
    await animationController.forward();
    await animationController.reverse();

    widget.onEnd();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: scale,
      child: widget.child,
    );
  }
}
