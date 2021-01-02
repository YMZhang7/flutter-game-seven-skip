import 'package:flutter/material.dart';
import '../components/components.dart';

class GameLoadScreen extends StatelessWidget {
  final int score;
  const GameLoadScreen({@required this.score});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(248, 131, 131, 1.0),
        child: Center(
          child: AnimatedTextFlash(score: score,)
          ),
        ),
    );
  }
}