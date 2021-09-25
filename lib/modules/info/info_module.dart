import 'package:anime_work_time_management/modules/info/presenter/info.page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class InfoModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => InfoPage()),
    // ChildRoute('/credits', child: (_, args) => CreditsPage()),
    // ChildRoute('/contacts', child: (_, args) => ContactsPage()),
    // ChildRoute('/licences', child: (_, args) => LicencesPage()),
  ];
}
