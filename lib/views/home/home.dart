import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pomodoro_timer/controller/dialog_controller.dart';
import 'package:pomodoro_timer/controller/play_audio_controller.dart';
import 'package:pomodoro_timer/model/timer_model.dart';
import 'package:pomodoro_timer/views/home/widgets/buttons.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //bool isEnable = false;
  late Timer _timer;
  final numberFormat = NumberFormat('00', 'en_US');

  DialogAlert dialogAlert = DialogAlert();
  ControllerAudioPlay controllerAudioPlay = ControllerAudioPlay();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[700],
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[900],
          title: Text('Pomodoro: ${TimerModel.pomodoroCount}'),
        ),
        body: Center(
          child: Text(
            numberFormat.format(TimerModel.minutes) +
                ":" +
                numberFormat.format(TimerModel.seconds),
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
                heroTag: 'Start timer',
                icon: const Icon(
                  Icons.play_arrow_outlined,
                  size: 30,
                ),
                color: Colors.lightBlue,
                callback: () {
                  _timer = Timer.periodic(const Duration(seconds: 1), (_) {
                    setState(() {
                      TimerModel.seconds--;
                      if (TimerModel.seconds <= 0) {
                        TimerModel.minutes--;
                        TimerModel.seconds = 59;
                      }
                      if (TimerModel.minutes <= 0 || TimerModel.seconds <= 0) {
                        _timer.cancel();
                        TimerModel.minutes = 25;
                        TimerModel.seconds = 0;
                        TimerModel.pomodoroCount++;
                        controllerAudioPlay.playAudio();
                        dialogAlert.showDialogAlert(context);
                      }
                    });
                  });
                },
              ),
              CustomButtom(
                heroTag: 'Pause timer',
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
                heroTag: 'reset timer',
                icon: const Icon(Icons.restore_outlined, size: 30),
                color: Colors.red,
                callback: () {
                  setState(() {
                    TimerModel.minutes = 25;
                    TimerModel.seconds = 00;
                    TimerModel.pomodoroCount = 0;
                  });
                },
              ),
            ],
          ),
        ));
  }
}
