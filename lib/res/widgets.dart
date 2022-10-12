import 'dart:ui';

import 'package:flutter/material.dart';

import 'text_styles.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 16, bottom: 240),
        child: Text(
          'Countdown Timer',
          style: TextStyles.sfpRegular32,
          textAlign: TextAlign.center,
        ));
  }
}

class TimerWidget extends StatefulWidget {
  const TimerWidget({Key? key}) : super(key: key);

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          SizedBox(
            width: 80,
            height: 80,
            child: DecoratedBox(
                decoration: const BoxDecoration(color: Color(0xFF252C32)),
              child: Center(
                child: Text('00', style: TextStyles.sfpRegular40,
                ),
              )
            ),
          ),
          Text(':',
              style: TextStyles.sfpRegular40)
        ],
      ),
    );
  }
}
