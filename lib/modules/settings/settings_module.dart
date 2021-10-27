import 'package:anime_work_time_management/core/app_settings.dart';
import 'package:anime_work_time_management/modules/settings/presenter/settings.page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SettingsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind<SettingsController>((i) => SettingsController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => SettingsPage()),
  ];
}
