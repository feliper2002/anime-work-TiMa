import 'package:anime_work_time_management/shared/utils/enum_classes.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @action
  String? backgroundImage(bool? switchMode) {
    if (switchMode == SwitchMode.day)
      return 'assets/images/day_bg.jpg';
    else
      return 'assets/images/night_bg.jpg';
  }
}
