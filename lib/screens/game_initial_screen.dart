import 'package:flutter/material.dart';
import 'package:seven_skip/components/components.dart';

class GameInitialScreen extends StatelessWidget {
  final int score;
  const GameInitialScreen({@required this.score});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedTitle(intervalStart: 0.0, intervalEnd: 0.5,),
          SizedBox(height: 150.0,),
          AnimatedStartButton(intervalStart: 0.6, intervalEnd: 1.0,),
        ],
      ),
    );
  }
}