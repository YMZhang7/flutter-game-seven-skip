import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seven_skip/bloc/blocs.dart';
import 'package:seven_skip/bloc/screens_event.dart';
import '../components/components.dart';

final GlobalKey <AnimatedNumberBubbleState> animatedNumberKey= GlobalKey<AnimatedNumberBubbleState>();


class GameScreen extends StatelessWidget {
  final int number;
  final int score;

  const GameScreen ({@required this.number, @required this.score});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          number % 7 == 1 && number != 1 ? PopupMessage(text: 'Well Done',) : Container(width: 0.0, height: 0.0,),
          Container(
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
                TextButton(
                  onPressed: (){
                    BlocProvider.of<ScreensBloc>(context).add(StartGame(
                      number: number + 1,
                      score: score + animatedNumberKey.currentState.timePassed,
                    ));
                    animatedNumberKey.currentState.controller.reset();
                    animatedNumberKey.currentState.controller.forward();
                  }, 
                  child: Text('Go!', style: TextStyle(fontSize: 50.0, color: Color.fromRGBO(248, 131, 131, 1.0))),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}