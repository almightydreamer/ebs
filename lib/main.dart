import 'package:flutter/material.dart';
import 'package:internshiptask1/res/svg_assets.dart';
import 'package:internshiptask1/home_page/timer.dart';

import 'home_Page/button.dart';
import 'home_page/circle_progress.dart';
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
  late int maxSeconds;
  Timer? timer;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.red,
          child: Column(
            children: [
              TitleWidget(),
              (statement)
                  ? TimerWidget(
                      hourTimerController: _hourTimerController,
                      minuteTimerController: _minuteTimerController,
                      secondTimerController: _secondTimerController)
                  : Container(
                      child: TimerCDCircleWidget(currentSeconds: currentSeconds,maxSeconds: maxSeconds)),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: (statement)
                      ? TimerButtonWidget(
                          icon: SvgAssets.start, onPress: _toggleTimer)
                      : TimerButtonWidget(
                          icon: SvgAssets.pause, onPress: _toggleTimer),
                ),
              ),
              const SizedBox(height: 69),
            ],
          ),
        ),
      ),
    );
  }

  void _toggleTimer() {

    statement = !statement;
    getSeconds();
    maxSeconds = currentSeconds;
    setState(() {});
    timer?.cancel();
    if (!statement) {
      timer = Timer.periodic(Duration(seconds: 1), (timer) {
        print(currentSeconds);
        currentSeconds--;
        if (currentSeconds <= 0 && (!statement)) {
          timer.cancel();
        }

        setState(() {});
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
