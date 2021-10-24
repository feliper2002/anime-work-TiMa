import 'package:mobx/mobx.dart';
part 'info_controller.g.dart';

class InfoController = _InfoControllerBase with _$InfoController;

abstract class _InfoControllerBase with Store {
  @observable
  List<Map<String, dynamic>> infoPage = [
    {
      'name': 'Credits',
      'route': '/info/credits',
    },
    {
      'name': 'About app',
      'route': '/info/about',
    },
  ];

  List<Map<String, dynamic>> credits = [
    {
      'title': 'App prototype',
      'name': 'Felipe Ribeiro',
    },
    {
      'title': 'Background art & drawing',
      'name': 'Victoria Emilly',
    },
  ];
}
