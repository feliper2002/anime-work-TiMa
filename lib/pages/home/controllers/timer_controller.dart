import 'package:anime_work_time_management/shared/theme/colors.dart';
import 'package:anime_work_time_management/shared/utils/enum_classes.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
part 'timer_controller.g.dart';

class TimerController = _TimerControllerBase with _$TimerController;

abstract class _TimerControllerBase with Store {
  @observable
  bool? started = false;

  @observable
  int? minutes = 50;

  @observable
  int? seconds = 0;

  @observable
  double? percent = .8;

  @observable
  TimerType? type = TimerType.work;

  @observable
  String? timeCountText;

  @computed
  String? get timerHeader {
    if (isWorking!)
      return 'STUDY/WORK TIME';
    else
      return 'WATCH ANIME TIME';
  }

  @action
  Color? getTimerColor(bool mode) {
    if (mode == SwitchMode.day)
      return AppColors.mainTimerColorLight;
    else
      return AppColors.mainTimerColorDark;
  }

  @action
  double? calculatePercentByTimeDecrease() {}

  @action
  start() {
    started = true;
  }

  @action
  stop() {
    started = false;
  }

  @action
  resetTimer() {}

  @action
  incrementPercent() {}

  @action
  pauseTimer() {}

  bool? get isWorking => type == TimerType.work;
  bool? get isWatchingAnime => type == TimerType.watchAnime;
}
