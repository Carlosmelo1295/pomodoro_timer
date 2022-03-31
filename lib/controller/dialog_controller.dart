import 'package:flutter/material.dart';
import 'package:pomodoro_timer/model/timer_model.dart';

class DialogAlert {
  Future<void> showDialogAlert(context) async {
    TimerModel.pomodoroCount == 5
        ? await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(
                  'Parabéns🎉🎉🎉, você completou ${TimerModel.pomodoroCount} pomodoros, faça uma pausa de 20 minutos.'),
            ),
          )
        : await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(
                  'Você completou o seu ${TimerModel.pomodoroCount}º pomodoro, faça uma pausa de 5 minutos.'),
            ),
          );
  }
}
