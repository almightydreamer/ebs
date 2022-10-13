import 'package:flutter/material.dart';
import 'package:internshiptask1/res/svg_assets.dart';
import 'package:internshiptask1/home_page/timer.dart';

import 'home_Page/button.dart';
import 'home_page/title.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool statement = true;

  final _hourTimerController = TextEditingController();
  final _minuteTimerController = TextEditingController();
  final _secondTimerController = TextEditingController();

  int currentSeconds = 0;
  Timer? timer;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.red,
          child: ListView(
            children: [
              TitleWidget(),
              (statement)
                  ? TimerWidget(
                      hourTimerController: _hourTimerController,
                      minuteTimerController: _minuteTimerController,
                      secondTimerController: _secondTimerController)
                  : Container(
                      child: Text('$currentSeconds',
                          style: TextStyle(fontSize: 50))),
              (statement)
                  ? TimerButtonWidget(
                      icon: SvgAssets.start, onPress: _toggleTimer)
                  : TimerButtonWidget(
                      icon: SvgAssets.pause, onPress: _toggleTimer)
            ],
          ),
        ),
      ),
    );
  }

  void _toggleTimer() {
    statement = !statement;
    getSeconds();
    setState(() {});
    if (!statement) {
      Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {});
        print(currentSeconds);
        currentSeconds--;
        if (currentSeconds <= 0 && (!statement)) {
          timer.cancel();
        }
      });
    }
  }

  void getSeconds() {
    int seconds = int.tryParse(_secondTimerController.value.text) ?? 0;
    int minutes = int.tryParse(_minuteTimerController.value.text) ?? 0;
    int hours = int.tryParse(_hourTimerController.value.text) ?? 0;
    currentSeconds = seconds + (minutes * 60) + (hours * 3600);
  }
}
