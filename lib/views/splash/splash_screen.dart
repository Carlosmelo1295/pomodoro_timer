import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () async {
      await Navigator.pushNamed(context, '/home');
    });
    return Scaffold(
      backgroundColor: Colors.blueGrey[700],
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Image.asset('./assets/images/desk.png'),
            const SizedBox(
                height: 100,
                width: 100,
                child: CircularProgressIndicator(
                  color: Colors.white,
                )),
          ],
        ),
      ),
    );
  }
}
