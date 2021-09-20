// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TimerController on _TimerControllerBase, Store {
  Computed<String?>? _$timerHeaderComputed;

  @override
  String? get timerHeader =>
      (_$timerHeaderComputed ??= Computed<String?>(() => super.timerHeader,
              name: '_TimerControllerBase.timerHeader'))
          .value;

  final _$startedAtom = Atom(name: '_TimerControllerBase.started');

  @override
  bool? get started {
    _$startedAtom.reportRead();
    return super.started;
  }

  @override
  set started(bool? value) {
    _$startedAtom.reportWrite(value, super.started, () {
      super.started = value;
    });
  }

  final _$minutesAtom = Atom(name: '_TimerControllerBase.minutes');

  @override
  int? get minutes {
    _$minutesAtom.reportRead();
    return super.minutes;
  }

  @override
  set minutes(int? value) {
    _$minutesAtom.reportWrite(value, super.minutes, () {
      super.minutes = value;
    });
  }

  final _$secondsAtom = Atom(name: '_TimerControllerBase.seconds');

  @override
  int? get seconds {
    _$secondsAtom.reportRead();
    return super.seconds;
  }

  @override
  set seconds(int? value) {
    _$secondsAtom.reportWrite(value, super.seconds, () {
      super.seconds = value;
    });
  }

  final _$timeWorkAtom = Atom(name: '_TimerControllerBase.timeWork');

  @override
  int? get timeWork {
    _$timeWorkAtom.reportRead();
    return super.timeWork;
  }

  @override
  set timeWork(int? value) {
    _$timeWorkAtom.reportWrite(value, super.timeWork, () {
      super.timeWork = value;
    });
  }

  final _$timeWatchAnimeAtom =
      Atom(name: '_TimerControllerBase.timeWatchAnime');

  @override
  int? get timeWatchAnime {
    _$timeWatchAnimeAtom.reportRead();
    return super.timeWatchAnime;
  }

  @override
  set timeWatchAnime(int? value) {
    _$timeWatchAnimeAtom.reportWrite(value, super.timeWatchAnime, () {
      super.timeWatchAnime = value;
    });
  }

  final _$percentAtom = Atom(name: '_TimerControllerBase.percent');

  @override
  double? get percent {
    _$percentAtom.reportRead();
    return super.percent;
  }

  @override
  set percent(double? value) {
    _$percentAtom.reportWrite(value, super.percent, () {
      super.percent = value;
    });
  }

  final _$typeAtom = Atom(name: '_TimerControllerBase.type');

  @override
  TimerType? get type {
    _$typeAtom.reportRead();
    return super.type;
  }

  @override
  set type(TimerType? value) {
    _$typeAtom.reportWrite(value, super.type, () {
      super.type = value;
    });
  }

  final _$timeCountTextAtom = Atom(name: '_TimerControllerBase.timeCountText');

  @override
  String? get timeCountText {
    _$timeCountTextAtom.reportRead();
    return super.timeCountText;
  }

  @override
  set timeCountText(String? value) {
    _$timeCountTextAtom.reportWrite(value, super.timeCountText, () {
      super.timeCountText = value;
    });
  }

  final _$timerAtom = Atom(name: '_TimerControllerBase.timer');

  @override
  Timer? get timer {
    _$timerAtom.reportRead();
    return super.timer;
  }

  @override
  set timer(Timer? value) {
    _$timerAtom.reportWrite(value, super.timer, () {
      super.timer = value;
    });
  }

  final _$timeAtom = Atom(name: '_TimerControllerBase.time');

  @override
  int? get time {
    _$timeAtom.reportRead();
    return super.time;
  }

  @override
  set time(int? value) {
    _$timeAtom.reportWrite(value, super.time, () {
      super.time = value;
    });
  }

  final _$secInPercentAtom = Atom(name: '_TimerControllerBase.secInPercent');

  @override
  double? get secInPercent {
    _$secInPercentAtom.reportRead();
    return super.secInPercent;
  }

  @override
  set secInPercent(double? value) {
    _$secInPercentAtom.reportWrite(value, super.secInPercent, () {
      super.secInPercent = value;
    });
  }

  final _$_TimerControllerBaseActionController =
      ActionController(name: '_TimerControllerBase');

  @override
  Color? getTimerColor(bool mode) {
    final _$actionInfo = _$_TimerControllerBaseActionController.startAction(
        name: '_TimerControllerBase.getTimerColor');
    try {
      return super.getTimerColor(mode);
    } finally {
      _$_TimerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic start() {
    final _$actionInfo = _$_TimerControllerBaseActionController.startAction(
        name: '_TimerControllerBase.start');
    try {
      return super.start();
    } finally {
      _$_TimerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getStartTimerValues() {
    final _$actionInfo = _$_TimerControllerBaseActionController.startAction(
        name: '_TimerControllerBase.getStartTimerValues');
    try {
      return super.getStartTimerValues();
    } finally {
      _$_TimerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic stop() {
    final _$actionInfo = _$_TimerControllerBaseActionController.startAction(
        name: '_TimerControllerBase.stop');
    try {
      return super.stop();
    } finally {
      _$_TimerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic restart() {
    final _$actionInfo = _$_TimerControllerBaseActionController.startAction(
        name: '_TimerControllerBase.restart');
    try {
      return super.restart();
    } finally {
      _$_TimerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic resetTimer() {
    final _$actionInfo = _$_TimerControllerBaseActionController.startAction(
        name: '_TimerControllerBase.resetTimer');
    try {
      return super.resetTimer();
    } finally {
      _$_TimerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic incrementPercent() {
    final _$actionInfo = _$_TimerControllerBaseActionController.startAction(
        name: '_TimerControllerBase.incrementPercent');
    try {
      return super.incrementPercent();
    } finally {
      _$_TimerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic pauseTimer() {
    final _$actionInfo = _$_TimerControllerBaseActionController.startAction(
        name: '_TimerControllerBase.pauseTimer');
    try {
      return super.pauseTimer();
    } finally {
      _$_TimerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
started: ${started},
minutes: ${minutes},
seconds: ${seconds},
timeWork: ${timeWork},
timeWatchAnime: ${timeWatchAnime},
percent: ${percent},
type: ${type},
timeCountText: ${timeCountText},
timer: ${timer},
time: ${time},
secInPercent: ${secInPercent},
timerHeader: ${timerHeader}
    ''';
  }
}
