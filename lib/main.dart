import 'package:flutter/material.dart';
import 'package:pomodoro_timer/views/home/home.dart';
import 'package:pomodoro_timer/views/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        initialRoute: '/',
        routes: {
          '/home': (context) => const MyHomePage(),
        },
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen()

        //const MyHomePage(title: 'Flutter Demo Home Page'),
        );
  }
}
