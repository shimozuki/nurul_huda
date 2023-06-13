import 'dart:async';
import 'package:nurulhudautan/view/page_main.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    goMainScreen();
  }

  // 5 seconds later -> onDoneControl
  Future<Timer> goMainScreen() async {
    return new Timer(Duration(seconds: 5), onDoneControl);
  }

  // route to MainScreen
  onDoneControl() async {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => PageMain()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                  image: AssetImage('assets/Splash_Screen.png'),
                  height: 250,
                  width: 250),
            ],
          ),
        ],
      )),
    );
  }
}
