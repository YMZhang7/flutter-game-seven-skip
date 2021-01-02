import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs.dart';

class ScreensBloc extends Bloc<ScreensEvent, ScreensState> {
  ScreensBloc() : super(ScreensInitial(score: 0));

  @override
  Stream<ScreensState> mapEventToState(
    ScreensEvent event,
  ) async* {
    if (event is LoadGame){
      yield GameLoading(score: event.score);
    } else if (event is StartGame){
      yield GameStart(number: event.number, score: event.score);
    } else if (event is EndGameFail){
      yield GameFailed(score: event.score);
    } else if (event is EndGameNoFail){
      yield ScreensInitial(score: event.score);
    }
  }
}
