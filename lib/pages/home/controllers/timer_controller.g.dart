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

  final _$_TimerControllerBaseActionController =
      ActionController(name: '_TimerControllerBase');

  @override
  Color? getTimerColor(int mode) {
    final _$actionInfo = _$_TimerControllerBaseActionController.startAction(
        name: '_TimerControllerBase.getTimerColor');
    try {
      return super.getTimerColor(mode);
    } finally {
      _$_TimerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  double? calculatePercentByTimeDecrease() {
    final _$actionInfo = _$_TimerControllerBaseActionController.startAction(
        name: '_TimerControllerBase.calculatePercentByTimeDecrease');
    try {
      return super.calculatePercentByTimeDecrease();
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
percent: ${percent},
type: ${type},
timeCountText: ${timeCountText},
timerHeader: ${timerHeader}
    ''';
  }
}
