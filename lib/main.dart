import 'package:flutter/material.dart';
import 'package:internshiptask1/res/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.red,
          child: ListView(
            children: [
              TitleWidget(),
              TimerWidget(),
             // TimerButtonWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
