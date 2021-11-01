// app_module.dart
import 'package:anime_work_time_management/core/app_settings.dart';
import 'package:anime_work_time_management/modules/home/controllers/home_controller.dart';
import 'package:anime_work_time_management/modules/home/controllers/timer_controller.dart';
import 'package:anime_work_time_management/modules/home/home_module.dart';
import 'package:anime_work_time_management/modules/info/controllers/info_controller.dart';
import 'package:anime_work_time_management/modules/info/info_module.dart';
import 'package:anime_work_time_management/modules/settings/settings_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind<HomeController>((i) => HomeController()),
    Bind<TimerController>((i) => TimerController()),
    Bind<SettingsController>((i) => SettingsController()),
    Bind<InfoController>((i) => InfoController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: HomeModule()),
    ModuleRoute('/info', module: InfoModule()),
    ModuleRoute('/settings', module: SettingsModule()),
  ];
}
