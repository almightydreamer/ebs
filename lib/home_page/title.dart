
import 'package:flutter/cupertino.dart';

import '../res/text_styles.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 79/*, bottom: 240*/),
        child: Text(
          'Countdown Timer',
          style: TextStyles.sfpRegular32,
          textAlign: TextAlign.center,
        ));
  }
}