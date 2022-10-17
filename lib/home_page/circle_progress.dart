import 'dart:math';

import 'package:flutter/material.dart';

import '../res/text_styles.dart';

class CircleProgress extends CustomPainter {
  final strokeCircle = 13.0;
  int currentSeconds;
  int maxSeconds;

  CircleProgress(this.currentSeconds, this.maxSeconds);

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

    print('cur $currentSeconds, max $maxSeconds');
    double angle = 2 * pi * (currentSeconds / maxSeconds);
    print('angle $angle');
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius),
        3*pi/2, angle, false, animationArc);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class TimerCDCircleWidget extends StatefulWidget {

  int currentSeconds;
  int maxSeconds;
  TimerCDCircleWidget({Key? key, required this.currentSeconds, required this.maxSeconds }) : super(key: key);

  @override
  State<TimerCDCircleWidget> createState() => _TimerCDCircleWidgetState();
}

class _TimerCDCircleWidgetState extends State<TimerCDCircleWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<int> _animation;

  // @override
  // void initState() {
  //   super.initState();
  //   _animationController = AnimationController(
  //       vsync: this, duration: Duration(milliseconds: 3000));
  //
  //   _animation = Tween<int>(begin: 0, end: 100).animate(_animationController)
  //     ..addListener(() {
  //       setState(() {
  //
  //       });
  //     });
  //   }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: [
            SizedBox(height:146),
            Center(
              child: CustomPaint(
                foregroundPainter: CircleProgress(widget.currentSeconds, widget.maxSeconds),
                child: Container(
                  width: 300,
                  height: 300,
                  child: Center(
                      child: Text('${(Duration(seconds: widget.currentSeconds))}'.split('.')[0].padLeft(8, '0'), style: TextStyles.sfpRegular40)),
                ),
              ),),
            SizedBox(height: 115),
          ],
        ));
  }
}
