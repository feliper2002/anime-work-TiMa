import 'dart:async';

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
  int? timeWork = 50;

  @observable
  int? timeWatchAnime = 25;

  @observable
  double? percent = .8;

  @observable
  TimerType? type = TimerType.work;

  @observable
  String? timeCountText;

  @observable
  Timer? timer;

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
  double? calculatePercentByTimeDecrease() {
    return ((minutes! * 60) + seconds!).toDouble();
  }

  setStarted(bool? value) {
    started = value;
  }

  @action
  start() {
    started = true;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (minutes == 0 && seconds == 0) {
        _changeTimerType();
      } else if (seconds == 0) {
        seconds = 59;
        minutes = minutes! - 1;
      } else {
        seconds = seconds! - 1;
      }
    });
  }

  _changeTimerType() {
    if (isWorking!) {
      type = TimerType.watchAnime;
      minutes = timeWatchAnime;
    } else {
      type = TimerType.work;
      minutes = timeWork;
    }
  }

  @action
  stop() {
    started = false;
    timer?.cancel();
  }

  @action
  restart() {
    stop();
    if (isWorking!) {
      minutes = timeWork;
      seconds = 0;
    } else {
      minutes = timeWatchAnime;
      seconds = 0;
    }
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
