import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/blocs.dart';
import 'screens/screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        create: (context) => ScreensBloc(),
        child: App(),
      )
    );
  }
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // int score = 0;
    return BlocBuilder<ScreensBloc, ScreensState>(
      builder: (context, state){
        if (state is ScreensInitial){
          print(state.score);
          return GameInitialScreen(score: state.score,);
        } else if (state is GameLoading){
          return GameLoadScreen(score: state.score,);
        } else if (state is GameStart){
          return GameScreen(
            number: state.number,
            score: state.score,
          );
        } else if (state is GameFailed){
          return GameFailedScreen();
        } else {
          return Container(width: 0.0, height: 0.0,);
        }
      },
    );
  }
}

class GameFailedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red.withOpacity(0.6),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text('Failed', style: TextStyle(
              fontSize: 50.0, 
              color: Colors.white, 
              shadows: [
                Shadow(
                  color: Colors.black.withOpacity(0.6), 
                  offset: Offset(3.0, 3.0), 
                  blurRadius: 8.0
                ),
              ]
            ),)),
          ],
        ),
      ),
    );
  }
}