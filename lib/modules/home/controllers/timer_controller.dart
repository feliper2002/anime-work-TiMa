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
  int? type;

  @observable
  Timer? _timer;

  @computed
  int? get timerMinutes => settings.minutes;

  @computed
  String? get timerHeader {
    if (_isWorking!)
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
  start() async {
    // Start [timer] countdown
    started = true;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (settings.minutes! == 0 && seconds == 0) {
        // When [minutes] and [seconds] are zero, the [TimerType] value changes
        _changeTimerType();
      } else if (seconds == 0) {
        seconds = 59;
        minutes = minutes! - 1;
        settings.decreaseMinutes();
      } else {
        seconds = seconds! - 1;
      }
    });
  }

  _changeTimerType() {
    if (_isWorking!) {
      settings.setTimerType(TimerType.watchAnime);
    } else {
      settings.setTimerType(TimerType.work);
    }
    restart();
  }

  _verifyTimerType() async {
    if (!_isWatchingAnime!) {
      minutes = settings.studyMinutes;
    } else {
      minutes = settings.animeMinutes;
    }
    await settings.setMinutes(minutes!);
  }

  @action
  Future<void> getStartTimerValues() async {
    seconds = 0;
    await settings.startApplicationTimer();
    await _verifyTimerType();
  }

  @action
  stop() {
    started = false;
    _timer?.cancel();
  }

  @action
  restart() async {
    stop();
    await settings.startApplicationTimer();
    await _verifyTimerType();
    seconds = 0;
  }

  bool? get _isWorking => settings.timerType == TimerType.work;
  bool? get _isWatchingAnime => settings.timerType == TimerType.watchAnime;
}
