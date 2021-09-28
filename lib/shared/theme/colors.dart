import 'package:flutter/material.dart';

class AppColors {
  static Color get headerColor => Colors.blueGrey.shade900;

  static Color get mainTimerColorLight => Color(0xff001767);
  static Color get mainTimerColorDark => Color(0xFF000720);

  static Color get timerProgressBgLight => Color(0xff9AB7FF);
  static Color get timerProgressBgDark => Color(0xFF000720);

  static Color get timerProgressBarLight => Color(0xff001767);
  static Color get timerProgressBarDark => Color(0xFF446DFF);

  static Color get actionButtonColorLight => Color(0xFFEEF1FC);
  static Color get actionButtonColorDark => Color(0xFF446DFF);

  static List<Color> get daySwitchBg => [Color(0xffFAFF00), Color(0xffEDB900)];
  static List<Color> get nightSwitchBg =>
      [Color(0xff3431D2), Color(0xff02004E)];

  static List<Color> get daySwitchSnap =>
      [Color(0xff001767), Colors.blueGrey.withOpacity(.2)];
  static List<Color> get nightSwitchSnap =>
      [Color(0xffFAFF00), Colors.white.withOpacity(.8)];
}
