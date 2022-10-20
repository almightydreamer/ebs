import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internshiptask1/controller/timer_controller.dart';

import '../res/text_styles.dart';

class CircleProgress extends CustomPainter {
  final strokeCircle = 13.0;
  final TimerController timerController = Get.find();

  CircleProgress();

  @override
  void paint(Canvas canvas, Size size) {
    Paint circle = Paint()
      ..strokeWidth = strokeCircle
      ..color = const Color(0xFFFF5473)
      ..style = PaintingStyle.stroke;
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = 150;
    canvas.drawCircle(center, radius, circle);

    Paint animationArc = Paint()
      ..strokeWidth = strokeCircle
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double angle = 2 *
        pi *
        (timerController.currentSeconds.value /
            timerController.maxSeconds.value);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), 3 * pi / 2,
        angle, false, animationArc);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class TimerCDCircleWidget extends StatelessWidget {
  const TimerCDCircleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TimerController timerController = Get.find();
    return Column(
      children: [
        const SizedBox(height: 146),
        Center(
          child: Obx(
            () => CustomPaint(
              foregroundPainter: CircleProgress(),
              child: SizedBox(
                width: 300,
                height: 300,
                child: Center(
                    child: Text(
                        '${(Duration(seconds: timerController.currentSeconds.value.toInt()))}'
                            .split('.')[0]
                            .padLeft(8, '0'),
                        style: TextStyles.sfpRegular40)),
              ),
            ),
          ),
        ),
        const SizedBox(height: 115),
      ],
    );
  }
}
