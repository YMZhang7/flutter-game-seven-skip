import 'package:equatable/equatable.dart';

abstract class ScreensState extends Equatable{
  final int score;
  const ScreensState({this.score});
  @override
  List<Object> get props => [score];
}

class ScreensInitial extends ScreensState {
  final int score;
  const ScreensInitial({this.score}) : super(score: score);
  @override
  List<Object> get props => [score];
}

class GameLoading extends ScreensState {
  final int score;
  const GameLoading({this.score}) : super(score: score);
  @override
  List<Object> get props => [score];
}

class GameStart extends ScreensState {
  final int score;
  final int number;
  const GameStart({this.number, this.score}) : super(score: score);
  @override
  List<Object> get props => [number, score];
}

class GameFailed extends ScreensState {
  final int score;
  const GameFailed({this.score}) : super(score: score);
  @override
  List<Object> get props => [score];
}
