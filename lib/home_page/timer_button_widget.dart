import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../controller/timer_controller.dart';

class TimerButtonWidget extends StatelessWidget {
  final SvgPicture icon;

  const TimerButtonWidget({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TimerController timerController = Get.find();
    return GestureDetector(
      onTap: timerController.toggleTimer,
      child: Container(
        width: 76,
        height: 76,
        decoration:
            const BoxDecoration(shape: BoxShape.circle, color: Color(0xFFFF5473)),
        child: Center(child: icon),
      ),
    );
  }
}
