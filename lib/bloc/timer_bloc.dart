import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pomodoro_timer/views/home/home.dart';

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  TimerBloc(TimerState initialState) : super(initialState);

  Stream<TimerState> mapEventToState(TimerEvent event) async* {
    if (event is CarregandoPagina) {
      await chamarPag();
      yield Carregando();
    }
  }

  Future chamarPag() async {
    Future.delayed(const Duration(seconds: 1), () {
      MaterialPageRoute(builder: (context) => const MyHomePage(title: ' '));
    });
  }
}
