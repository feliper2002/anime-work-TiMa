// app_module.dart
import 'package:anime_work_time_management/core/app_settings.dart';
import 'package:anime_work_time_management/modules/home/controllers/home_controller.dart';
import 'package:anime_work_time_management/modules/home/controllers/timer_controller.dart';
import 'package:anime_work_time_management/modules/home/home_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => HomeController()),
    Bind((i) => TimerController()),
    Bind((i) => SettingsController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: HomeModule()),
  ];
}
