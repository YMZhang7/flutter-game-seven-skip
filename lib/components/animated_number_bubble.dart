import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seven_skip/bloc/screens_bloc.dart';
import '../bloc/blocs.dart';

class AnimatedNumberBubble extends StatefulWidget {
  final int number;
  final int score;
  final Color color;
  const AnimatedNumberBubble({@required this.number, @required this.score, @required this.color, Key key}) : super(key: key);
  @override
  AnimatedNumberBubbleState createState() => AnimatedNumberBubbleState();
}

class AnimatedNumberBubbleState extends State<AnimatedNumberBubble> with TickerProviderStateMixin{
  AnimationController controller;
  Animation _animation;

  int get timePassed => controller.lastElapsedDuration == null ? 3 : controller.lastElapsedDuration.inSeconds;
  
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3)
    );
    _animation = Tween(
      begin: 0.3,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeIn,
      )
    );
    controller.addStatusListener((status) {
      if(status == AnimationStatus.completed) {
        print('completed');
        if (widget.number % 7 != 0){
          BlocProvider.of<ScreensBloc>(context).add(EndGameFail(score: widget.score));
          print('failed');
        } else {
          print('Well done');
          controller.reset();
          controller.forward();
          BlocProvider.of<ScreensBloc>(context).add(StartGame(number: widget.number + 1, score: widget.score));
        }
      }
    });
    controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: Container(
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.all(Radius.circular(100.0))
        ),
        child: Center(child: Text(widget.number.toString(), style: TextStyle(fontSize: 60.0),)),
      ),
    );
  }
}