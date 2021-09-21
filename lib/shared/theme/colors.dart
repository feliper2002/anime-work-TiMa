import 'package:flutter/material.dart';

class AppColors {
  static Color get headerColor => Colors.blueGrey.shade900;

  static Color get mainTimerColorLight => Color(0xff001767);
  static Color get mainTimerColorDark => Colors.white;

  static Color get timerProgressBg => Color(0xff9AB7FF);

  static List<Color> get daySwitchBg => [Color(0xffFAFF00), Color(0xffEDB900)];
  static List<Color> get nightSwitchBg =>
      [Color(0xff3431D2), Color(0xff02004E)];

  static List<Color> get daySwitchSnap =>
      [Color(0xff001767), Colors.blueGrey.withOpacity(.2)];
  static List<Color> get nightSwitchSnap =>
      [Color(0xffFAFF00), Colors.white.withOpacity(.8)];
}
