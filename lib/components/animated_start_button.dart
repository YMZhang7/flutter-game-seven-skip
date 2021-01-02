import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seven_skip/bloc/blocs.dart';
import 'package:seven_skip/bloc/screens_bloc.dart';

class AnimatedStartButton extends StatefulWidget {
  final double intervalStart;
  final double intervalEnd;
  final int score;
  const AnimatedStartButton({this.intervalStart, this.intervalEnd, @required this.score});
  @override
  _AnimatedStartButtonState createState() => _AnimatedStartButtonState();
}

class _AnimatedStartButtonState extends State<AnimatedStartButton> with TickerProviderStateMixin{
  AnimationController _animationController;
  Animation<double> _opacityAnimation;
  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1200)
    );
    _opacityAnimation = Tween<double>(
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
    print('hh');
    return FadeTransition(
      opacity: _opacityAnimation,
      child: RaisedButton(
        onPressed: () => BlocProvider.of<ScreensBloc>(context).add(LoadGame(score: widget.score)),
        color: Color.fromRGBO(248, 131, 131, 1.0),
        child: Container(
          width: 100.0,
          height: 50.0,
          child: Center(child: Text('START', style: TextStyle(fontSize: 25.0, color: Colors.white))),
        ),
      ),
    );
  }
}