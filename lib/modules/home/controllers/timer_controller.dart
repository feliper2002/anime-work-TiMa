import 'dart:async';
import 'dart:math' as math;

import 'package:anime_work_time_management/core/app_settings.dart';
import 'package:anime_work_time_management/shared/theme/colors.dart';
import 'package:anime_work_time_management/shared/utils/enum_classes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'timer_controller.g.dart';

class TimerController = _TimerControllerBase with _$TimerController;

abstract class _TimerControllerBase with Store {
  final settings = Modular.get<SettingsController>();

  @observable
  bool? started = false;

  @observable
  int? minutes;

  @observable
  int? seconds = 0;

  @observable
  int? timeWork;

  @observable
  int? timeWatchAnime;

  @observable
  double percent = 0;

  @observable
  String? timeCountText;

  @observable
  int? type;

  @observable
  Timer? _timer;

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

  setStarted(bool? value) {
    started = value;
  }

  @observable
  int? time;

  @observable
  double? secInPercent;

  @action
  start() {
    // Start [timer] countdown
    started = true;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      time = minutes! * 60 - seconds!;
      secInPercent = (time! / 100);
      if (time! > 0) {
        time = time! - 1;
      }
      if (minutes! == 0 && seconds == 0) {
        // When [minutes] and [seconds] are zero, the [TimerType] value changes
        _changeTimerType();
        percent = 0;
      } else if (seconds == 0) {
        seconds = 59;
        minutes = minutes! - 1;
      } else {
        if (percent < 1) {
          // In case of [timer] countdown continues decreasing, the percent
          // 'll increase based in a calculus by the total seconds missing
          percent += ((55 / time!) / 60);
        }
        seconds = seconds! - 1;
      }
      print(percent);
    });
  }

  _changeTimerType() {
    minutes = settings.minutes;
    if (isWorking!) {
      settings.setTimerType(TimerType.watchAnime);
    } else {
      settings.setTimerType(TimerType.work);
    }
  }

  @action
  getStartTimerValues() {
    percent = 0;
    if (isWorking!) {
      minutes = settings.minutes;
    } else
      minutes = settings.minutes;
  }

  @action
  setTimerType(int? tipo) async {
    type = tipo;
    if (type == 0) {
      minutes = 50;
      await settings.setMinutes(minutes!);
    } else {
      minutes = 25;
      await settings.setMinutes(minutes!);
    }
  }

  @action
  stop() {
    started = false;
    _timer?.cancel();
  }

  @action
  restart() {
    percent = 0;
    stop();
    if (isWorking!) {
      minutes = settings.timer['studyMinutes'];
      seconds = 0;
    } else {
      minutes = settings.timer['animeMinutes'];
      seconds = 0;
    }
  }

  bool? get isWorking => settings.timerType == TimerType.work;
  bool? get isWatchingAnime => settings.timerType == TimerType.watchAnime;
}
