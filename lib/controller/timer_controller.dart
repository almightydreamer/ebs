import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TimerController extends GetxController {

  RxDouble currentSeconds = 0.0.obs;
  RxDouble maxSeconds = 0.0.obs;
  RxBool statement = true.obs;

  final hourTimerController = TextEditingController();
  final minuteTimerController = TextEditingController();
  final secondTimerController = TextEditingController();

  void toggleTimer() {
    Timer? timer;
    statement.value = !statement.value;
    currentSeconds.value = 0;
    getSeconds();
    maxSeconds.value = currentSeconds.value;
    timer?.cancel();
    if (!statement.value) {
      timer = Timer.periodic(const Duration(milliseconds: 1), (timer) {
        currentSeconds.value -= 0.001;
        if (currentSeconds.value <= 0 && (!statement.value)) {
          timer.cancel();
        }
      });
    }
  }

  void getSeconds() {
    int seconds = int.tryParse(secondTimerController.value.text) ?? 0;
    int minutes = int.tryParse(minuteTimerController.value.text) ?? 0;
    int hours = int.tryParse(hourTimerController.value.text) ?? 0;
    currentSeconds.value = seconds + (minutes * 60) + (hours * 3600);
  }
}