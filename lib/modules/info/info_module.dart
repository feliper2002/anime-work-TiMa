import 'package:anime_work_time_management/modules/info/presenter/about_app.page.dart';
import 'package:anime_work_time_management/modules/info/presenter/info.page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'presenter/credits.page.dart';

class InfoModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => InfoPage()),
    ChildRoute('/credits', child: (_, args) => CreditsPage()),
    ChildRoute('/about', child: (_, args) => AboutAppPage()),
  ];
}
