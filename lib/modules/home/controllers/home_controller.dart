import 'package:anime_work_time_management/shared/utils/app_images.dart';
import 'package:anime_work_time_management/shared/utils/enum_classes.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @action
  String? backgroundImage(bool? switchMode) {
    // Changes home page [background image] by getting switchMode value
    if (switchMode == SwitchMode.day)
      return AppImages.bgDay;
    else
      return AppImages.bgNight2;
  }
}
