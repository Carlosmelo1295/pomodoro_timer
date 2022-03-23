part of 'timer_bloc.dart';

abstract class TimerState extends Equatable {
  const TimerState();
}

class Carregando extends TimerState {
  @override
  List<Object> get props => [];
}

class Carregado extends TimerState {
  @override
  List<Object> get props => [];
}
