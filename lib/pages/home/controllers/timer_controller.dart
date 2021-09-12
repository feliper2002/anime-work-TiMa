import 'package:anime_work_time_management/shared/theme/colors.dart';
import 'package:anime_work_time_management/shared/utils/enum_classes.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
part 'timer_controller.g.dart';

class TimerController = _TimerControllerBase with _$TimerController;

abstract class _TimerControllerBase with Store {
  @observable
  double? percent = .8;

  @observable
  TimerType? type = TimerType.work;

  @observable
  String? timerHeader;

  @observable
  String? timeCountText;

  @observable
  Color? timerColor = AppColors.mainTimerColorLight;

  @action
  String? getTimerHeader() {
    if (type == TimerType.work)
      timerHeader = 'STUDY/WORK TIME';
    else
      timerHeader = 'WATCH ANIME TIME';
    return timerHeader;
  }

  @action
  Color? getTimerColor(int mode) {
    if (mode == SwitchMode.day)
      return AppColors.mainTimerColorLight;
    else
      return AppColors.mainTimerColorDark;
  }

  @action
  double? calculatePercentByTimeDecrease() {}

  @action
  resetTimer() {}

  @action
  incrementPercent() {}

  @action
  pauseTimer() {}
}
