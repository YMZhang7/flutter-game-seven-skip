import 'package:flutter/material.dart';

class AnimatedTitle extends StatefulWidget {
  final double intervalStart;
  final double intervalEnd;
  const AnimatedTitle({this.intervalStart, this.intervalEnd});
  @override
  _AnimatedTitleState createState() => _AnimatedTitleState();
}

class _AnimatedTitleState extends State<AnimatedTitle> with TickerProviderStateMixin{
  AnimationController _animationController;
  Animation<double> _opacityAnimation;
  Animation<Offset> _slideAnimation;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2200)
    );
    _opacityAnimation = Tween(
      begin: 0.0,
      end: 1.0
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: widget.intervalStart == null ? Curves.easeOutCirc : Interval(
          widget.intervalStart, widget.intervalEnd,
          curve: Curves.easeOutCirc,
        ),
      )
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0.0, -2.0),
      end: Offset.zero
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: widget.intervalStart == null ? Curves.easeOutCirc : Interval(
          widget.intervalStart, widget.intervalEnd,
          curve: Curves.easeOutCirc,
        ),
      )
    );
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacityAnimation,
      child: SlideTransition(
        child: Center(child: Text('7-Skip!', style: TextStyle(fontSize: 50.0),)),
        position: _slideAnimation,
      )
    );
  }
}