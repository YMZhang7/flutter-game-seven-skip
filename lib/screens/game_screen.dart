import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seven_skip/bloc/blocs.dart';
import 'package:seven_skip/bloc/screens_event.dart';
import 'package:swipedetector/swipedetector.dart';
import '../components/components.dart';

final GlobalKey <AnimatedNumberBubbleState> animatedNumberKey= GlobalKey<AnimatedNumberBubbleState>();


class GameScreen extends StatelessWidget {
  final int number;
  final int score;

  const GameScreen ({@required this.number, @required this.score});
  @override
  Widget build(BuildContext context) {
    String direction = '';
    Random ran = new Random();
    switch(ran.nextInt(4)){
      case 0:
        direction = 'up';
        break;
      case 1:
        direction = 'left';
        break;
      case 2:
        direction = 'down';
        break;
      case 3:
        direction = 'right';
        break;
    }
    return Scaffold(
      body: Stack(
        children: [
          number % 7 == 1 && number != 1 ? PopupMessage(text: 'Well Done',) : Container(width: 0.0, height: 0.0,),
          SwipeDetector(
            onSwipeDown: () {
              if (direction != 'down'){
                BlocProvider.of<ScreensBloc>(context).add(EndGameFail(score: score));
              } else {
                BlocProvider.of<ScreensBloc>(context).add(StartGame(
                  number: number + 1,
                  score: score + calculateScore(animatedNumberKey.currentState.timePassed),
                ));
                animatedNumberKey.currentState.controller.reset();
                animatedNumberKey.currentState.controller.forward();
              }
            },
            onSwipeLeft: () {
              if (direction != 'left'){
                BlocProvider.of<ScreensBloc>(context).add(EndGameFail(score: score));
              } else {
                BlocProvider.of<ScreensBloc>(context).add(StartGame(
                  number: number + 1,
                  score: score + calculateScore(animatedNumberKey.currentState.timePassed),
                ));
                animatedNumberKey.currentState.controller.reset();
                animatedNumberKey.currentState.controller.forward();
              }
            },
            onSwipeRight: () {
              if (direction != 'right'){
                BlocProvider.of<ScreensBloc>(context).add(EndGameFail(score: score));
              } else {
                BlocProvider.of<ScreensBloc>(context).add(StartGame(
                  number: number + 1,
                  score: score + calculateScore(animatedNumberKey.currentState.timePassed),
                ));
                animatedNumberKey.currentState.controller.reset();
                animatedNumberKey.currentState.controller.forward();
              }
            },
            onSwipeUp: () {
              if (direction != 'up'){
                BlocProvider.of<ScreensBloc>(context).add(EndGameFail(score: score));
              } else {
                BlocProvider.of<ScreensBloc>(context).add(StartGame(
                  number: number + 1,
                  score: score + calculateScore(animatedNumberKey.currentState.timePassed),
                ));
                animatedNumberKey.currentState.controller.reset();
                animatedNumberKey.currentState.controller.forward();
              }
            },
            child: Container(
              color: Color.fromRGBO(248, 131, 131, 0.6),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Row(
                      children: [
                        Text('Score: ' + score.toString(), style: TextStyle(fontSize: 30.0),)
                      ],
                    ),
                  ),
                  SizedBox(height: 100.0,),
                  AnimatedNumberBubble(
                    number: this.number, 
                    color: Color.fromRGBO(248, 131, 131, 1.0),
                    score: score,
                    key: animatedNumberKey,
                  ),
                  SizedBox(height: 50.0,),
                  // TextButton(
                  //   onPressed: (){
                  //     if (number % 7 == 0){
                  //       BlocProvider.of<ScreensBloc>(context).add(EndGameFail(score: score));
                  //     } else {
                  //       BlocProvider.of<ScreensBloc>(context).add(StartGame(
                  //         number: number + 1,
                  //         score: score + calculateScore(animatedNumberKey.currentState.timePassed),
                  //       ));
                  //       animatedNumberKey.currentState.controller.reset();
                  //       animatedNumberKey.currentState.controller.forward();
                  //     }
                  //   }, 
                  //   child: Text('Go!', style: TextStyle(fontSize: 50.0, color: Color.fromRGBO(248, 131, 131, 1.0))),
                  // ),
                  Text(direction, style: TextStyle(fontSize: 50.0, color: Color.fromRGBO(248, 131, 131, 1.0)),)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  int calculateScore(int time){
    if (time < 1){
      return 3;
    } else if (time < 2){
      return 2;
    } else {
      return 1;
    }
  }
}