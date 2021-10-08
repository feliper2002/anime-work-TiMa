// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TimerController on _TimerControllerBase, Store {
  Computed<int?>? _$timerMinutesComputed;

  @override
  int? get timerMinutes =>
      (_$timerMinutesComputed ??= Computed<int?>(() => super.timerMinutes,
              name: '_TimerControllerBase.timerMinutes'))
          .value;
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

  final _$typeAtom = Atom(name: '_TimerControllerBase.type');

  @override
  int? get type {
    _$typeAtom.reportRead();
    return super.type;
  }

  @override
  set type(int? value) {
    _$typeAtom.reportWrite(value, super.type, () {
      super.type = value;
    });
  }

  final _$_timerAtom = Atom(name: '_TimerControllerBase._timer');

  @override
  Timer? get _timer {
    _$_timerAtom.reportRead();
    return super._timer;
  }

  @override
  set _timer(Timer? value) {
    _$_timerAtom.reportWrite(value, super._timer, () {
      super._timer = value;
    });
  }

  final _$startAsyncAction = AsyncAction('_TimerControllerBase.start');

  @override
  Future start() {
    return _$startAsyncAction.run(() => super.start());
  }

  final _$getStartTimerValuesAsyncAction =
      AsyncAction('_TimerControllerBase.getStartTimerValues');

  @override
  Future<int> getStartTimerValues() {
    return _$getStartTimerValuesAsyncAction
        .run(() => super.getStartTimerValues());
  }

  final _$restartAsyncAction = AsyncAction('_TimerControllerBase.restart');

  @override
  Future restart() {
    return _$restartAsyncAction.run(() => super.restart());
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
  String toString() {
    return '''
started: ${started},
minutes: ${minutes},
seconds: ${seconds},
type: ${type},
timerMinutes: ${timerMinutes},
timerHeader: ${timerHeader}
    ''';
  }
}
