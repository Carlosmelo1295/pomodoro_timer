import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pomodoro_timer/model/timer_model.dart';
import 'package:pomodoro_timer/views/home/widgets/buttons.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TimerModel timerModel = TimerModel(
    minutes: 25,
    seconds: 0,
    pomodoroCount: 0,
  );
  late Timer _timer;
  final NumberFormat _numberFormat = NumberFormat();

  //bool isEnable = false;
  Future<void> _showDialog() async {
    timerModel.pomodoroCount == 5
        ? await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(
                  'Parabéns🎉🎉🎉, você completou ${timerModel.pomodoroCount} pomodoros, faça uma pausa de 20 minutos.'),
            ),
          )
        : await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text(
                  'Você completou o seu ${timerModel.pomodoroCount}º pomodoro, faça uma pausa de 5 minutos.'),
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[700],
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[900],
          title: Text('Pomodoro: ${timerModel.pomodoroCount}'),
        ),
        body: Center(
          child: Text(
            '${_numberFormat.format(timerModel.minutes)}:${_numberFormat.format(timerModel.seconds)}',
            style: const TextStyle(
              fontSize: 60,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.blueGrey[900],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CustomButtom(
                icon: const Icon(
                  Icons.play_arrow_outlined,
                  size: 30,
                ),
                color: Colors.lightBlue,
                callback: () {
                  _timer =
                      Timer.periodic(const Duration(milliseconds: 50), (_) {
                    setState(() {
                      timerModel.seconds--;
                      if (timerModel.seconds <= 0) {
                        timerModel.minutes--;
                        timerModel.seconds = 59;
                      }
                      if (timerModel.minutes <= 0 || timerModel.seconds <= 0) {
                        _timer.cancel();
                        timerModel.minutes = 25;
                        timerModel.seconds = 0;
                        timerModel.pomodoroCount++;

                        _showDialog();
                      }
                    });
                  });
                },
              ),
              CustomButtom(
                icon: const Icon(
                  Icons.pause_circle_outline,
                  size: 30,
                ),
                color: Colors.amber,
                callback: () {
                  setState(() {
                    _timer.cancel();
                  });
                },
              ),
              CustomButtom(
                icon: const Icon(Icons.restore_outlined, size: 30),
                color: Colors.red,
                callback: () {
                  setState(() {
                    timerModel.minutes = 25;
                    timerModel.seconds = 00;
                    timerModel.pomodoroCount = 0;
                  });
                },
              ),
            ],
          ),
        ));
  }
}
