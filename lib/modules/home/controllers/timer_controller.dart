import 'dart:async';

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
  int? get timerMinutes => settings.minutes;

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
  start() async {
    // Start [timer] countdown
    started = true;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      time = settings.minutes! * 60;
      secInPercent = (time! / 100);
      if (time! > 0) {
        time = time! - 1;
      }
      if (settings.minutes! == 0 && seconds == 0) {
        // When [minutes] and [seconds] are zero, the [TimerType] value changes
        _changeTimerType();
        percent = 0;
      } else if (seconds == 0) {
        seconds = 59;
        minutes = minutes! - 1;
        settings.decreaseMinutes();
      } else {
        if (percent < 1) {
          // In case of [timer] countdown continues decreasing, the percent
          // 'll increase based in a calculus by the total seconds missing
          // percent += ((100 / time!) / 60);
          // percent += (secInPercent! / time!);
        }
        seconds = seconds! - 1;
      }
      print(percent);
    });
  }

  _changeTimerType() {
    if (isWorking!) {
      settings.setTimerType(TimerType.watchAnime);
    } else {
      settings.setTimerType(TimerType.work);
    }
    minutes = settings.minutes;
    settings.setMinutes(minutes!);
    restart();
  }

  @action
  Future<void> getStartTimerValues() async {
    await settings.startApplicationTimer();
    percent = 0;
    if (isWorking!) {
      minutes = settings.timer['studyMinutes'];
      await settings.setMinutes(minutes!);
      seconds = 0;
    } else {
      minutes = settings.timer['animeMinutes'];
      await settings.setMinutes(minutes!);
      seconds = 0;
    }
  }

  @action
  setTimerType(int? tipo) async {
    type = tipo;
    if (type == 0) {
      minutes = settings.timer['studyMinutes'];
      await settings.setMinutes(minutes!);
    } else {
      minutes = settings.timer['animeMinutes'];
      await settings.setMinutes(minutes!);
    }
    restart();
  }

  @action
  stop() {
    started = false;
    _timer?.cancel();
  }

  @action
  restart() async {
    percent = 0;
    await settings.startApplicationTimer();
    stop();
    seconds = 0;
    if (isWorking!) {
      minutes = settings.timer['studyMinutes'];
      await settings.setMinutes(minutes!);
      seconds = 0;
    } else {
      minutes = settings.timer['animeMinutes'];
      await settings.setMinutes(minutes!);
      seconds = 0;
    }
  }

  bool? get isWorking => settings.timerType == TimerType.work;
  bool? get isWatchingAnime => settings.timerType == TimerType.watchAnime;
}
