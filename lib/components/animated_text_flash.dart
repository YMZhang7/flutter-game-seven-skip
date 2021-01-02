import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seven_skip/bloc/blocs.dart';
import 'package:seven_skip/bloc/screens_event.dart';

class AnimatedTextFlash extends StatefulWidget {
  final int score;
  const AnimatedTextFlash({@required this.score});

  @override
  _AnimatedTextFlashState createState() => _AnimatedTextFlashState();
}

class _AnimatedTextFlashState extends State<AnimatedTextFlash> with TickerProviderStateMixin{
  AnimationController _controller;
  Animation<double> _fadeAnimation1;
  Animation<double> _fadeAnimation2;
  Animation<double> _fadeAnimation3;
  Animation<double> _fadeAnimation4;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 6)
    );
    _fadeAnimation1 = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.0, 0.2,
          curve: Curves.easeOutCirc,
        ),
      )      
    );
    _fadeAnimation2 = Tween(
      begin: 1.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.2, 0.4,
          curve: Curves.easeOutCirc,
        ),
      )
    );
    _fadeAnimation3 = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.6, 0.8,
          curve: Curves.easeOutCirc,
        ),
      )      
    );
    _fadeAnimation4 = Tween(
      begin: 1.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.8, 1.0,
          curve: Curves.easeOutCirc,
        ),
      )
    );
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed){
        BlocProvider.of<ScreensBloc>(context).add(StartGame(number: 1, score: widget.score));
      }
    });
    _controller.forward();
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FadeTransition(
          opacity: _fadeAnimation1,
          child: FadeTransition(
            opacity: _fadeAnimation2,
            child: Center(child: Text('Ready?', style: TextStyle(fontSize: 50.0),)),
          ),
        ),
        FadeTransition(
          opacity: _fadeAnimation3,
          child: FadeTransition(
            opacity: _fadeAnimation4,
            child: Center(child: Text('Go!', style: TextStyle(fontSize: 50.0),)),
          ),
        ),
      ]
    );
  }
}