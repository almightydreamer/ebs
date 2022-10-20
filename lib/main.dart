import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internshiptask1/controller/timer_controller.dart';
import 'package:internshiptask1/res/svg_assets.dart';
import 'package:internshiptask1/home_page/timer.dart';
import 'home_Page/timer_button_widget.dart';
import 'home_page/circle_progress.dart';
import 'home_page/title.dart';

void main() {
  runApp(const GetMaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Get.put(TimerController());
  }

  @override
  Widget build(BuildContext context) {
    final TimerController timerController = Get.find();
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.red,
          child: Column(
            children: [
              const TitleWidget(),
              Obx(() => (timerController.statement.value)
                  ? const TimerWidget()
                  : const TimerCDCircleWidget()),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Obx(()=> TimerButtonWidget(icon : (timerController.statement.value) ? SvgAssets.start : SvgAssets.pause))
                ),
              ),
              const SizedBox(height: 69),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    final TimerController timerController = Get.find();
    timerController.dispose();
    super.dispose();
  }
}
