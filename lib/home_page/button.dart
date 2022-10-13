import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class TimerButtonWidget extends StatelessWidget {
  final SvgPicture icon;
  final VoidCallback onPress;

  const TimerButtonWidget({Key? key, required this.icon, required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
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
