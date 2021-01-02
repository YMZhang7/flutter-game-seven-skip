import 'package:meta/meta.dart';

abstract class ScreensEvent {
  final int score;
  const ScreensEvent({@required this.score});
}

class LoadGame extends ScreensEvent {
  final int score;
  const LoadGame({@required this.score}) : super(score: score);
}

class StartGame extends ScreensEvent {
  final int number;
  final int score;
  StartGame({@required this.number, @required this.score}) : super(score: score);
}

class EndGameFail extends ScreensEvent {
  final int score;
  const EndGameFail({@required this.score}) : super(score: score);
}

class EndGameNoFail extends ScreensEvent {
  final int score;
  const EndGameNoFail({@required this.score}) : super(score: score);
}