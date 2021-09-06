import 'package:mobx/mobx.dart';
part 'timer_controller.g.dart';

class TimerController = _TimerControllerBase with _$TimerController;

abstract class _TimerControllerBase with Store {
  @observable
  double? percent = .1;

  @observable
  String? timeCountText;

  @action
  double? calculatePercentByTimeDecrease() {}

  @action
  resetTimer() {}

  @action
  incrementPercent() {}

  @action
  pauseTimer() {}
}
