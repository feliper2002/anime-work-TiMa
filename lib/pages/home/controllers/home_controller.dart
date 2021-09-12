import 'package:anime_work_time_management/shared/utils/enum_classes.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  int? mode = SwitchMode.day;

  @action
  changeSwitchMode(int? newMode) {
    mode = newMode;
    print(mode);
  }

  @computed
  String? get backgroundImage {
    if (mode == SwitchMode.day)
      return 'assets/images/day_bg.jpg';
    else
      return 'assets/images/night_bg.jpg';
  }
}
