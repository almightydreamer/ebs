import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../res/text_styles.dart';

import '../res/svg_assets.dart';

class TimerWidget extends StatefulWidget {
  final TextEditingController hourTimerController;
  final TextEditingController minuteTimerController;
  final TextEditingController secondTimerController;

  const TimerWidget({Key? key,
    required this.hourTimerController,
    required this.minuteTimerController,
    required this.secondTimerController})
      : super(key: key);

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 240),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //
              // hour insert box
              //
              SizedBox(
                width: 80,
                height: 80,
                child: DecoratedBox(
                    decoration: const BoxDecoration(color: Color(0xFF252C32)),
                    child: Center(
                      child: TextField(
                        controller: widget.hourTimerController,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: TextStyles.sfpRegular40,
                        decoration: InputDecoration(
                            hintText: '00', hintStyle: TextStyles.sfpRegular40),
                      ),
                    )),
              ),
              SizedBox(
                width: 29,
                height: 80,
                child: Center(
                  child: Text(':', style: TextStyles.sfpRegular40),
                ),
              ),
              //
              // minute insert box
              //
              SizedBox(
                width: 80,
                height: 80,
                child: DecoratedBox(
                    decoration: const BoxDecoration(color: Color(0xFF252C32)),
                    child: Center(
                      child: TextField(
                        controller: widget.minuteTimerController,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: TextStyles.sfpRegular40,
                        decoration: InputDecoration(
                            hintText: '00', hintStyle: TextStyles.sfpRegular40),
                      ),
                    )),
              ),
              SizedBox(
                width: 29,
                height: 80,
                child: Center(
                  child: Text(':', style: TextStyles.sfpRegular40),
                ),
              ),
              //
              // second insert box
              //
              SizedBox(
                width: 80,
                height: 80,
                child: DecoratedBox(
                    decoration: const BoxDecoration(color: Color(0xFF252C32)),
                    child: Center(
                      child: TextField(
                        controller: widget.secondTimerController,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: TextStyles.sfpRegular40,
                        decoration: InputDecoration(
                            hintText: '00', hintStyle: TextStyles.sfpRegular40),
                      ),
                    )),
              )
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: 80,
                  height: 15,
                  child: Center(
                    child: Text(
                      'hour(s)',
                      style: TextStyles.sfpRegular14,
                    ),
                  )),
              const SizedBox(
                width: 29,
                height: 15,
              ),
              SizedBox(
                  width: 80,
                  height: 15,
                  child: Center(
                    child: Text(
                      'minute(s)',
                      style: TextStyles.sfpRegular14,
                    ),
                  )),
              const SizedBox(
                width: 29,
                height: 15,
              ),
              SizedBox(
                  width: 80,
                  height: 15,
                  child: Center(
                    child: Text(
                      'second(s)',
                      style: TextStyles.sfpRegular14,
                    ),
                  ))
            ],
          ),
          //const SizedBox(height: 205, width: 20)
        ],
      ),
    );
  }
}

