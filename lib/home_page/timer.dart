
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/timer_controller.dart';
import '../res/text_styles.dart';

class TimerWidget extends StatelessWidget {


  const TimerWidget({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TimerController timerController = Get.find();
    return Column(
      children: [
        const SizedBox(height: 240),
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
                      controller: timerController.hourTimerController,
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
                      controller: timerController.minuteTimerController,
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
                      controller: timerController.secondTimerController,
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
    );
  }
}

