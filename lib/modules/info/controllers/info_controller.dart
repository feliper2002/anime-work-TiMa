import 'package:mobx/mobx.dart';
import 'package:url_launcher/url_launcher.dart';
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

  List<Map<String, dynamic>> links = [
    {
      'title': 'GitHub',
      'icon_path': 'assets/images/github-logo.png',
      'link': 'https://github.com/feliper2002',
    },
    {
      'title': 'Twitter',
      'icon_path': 'assets/images/twitter-logo.png',
      'link': 'https://twitter.com/feliper_dev',
    },
  ];

  launchURL(String? url) async =>
      await canLaunch(url!) ? await launch(url) : throw 'Could not launch $url';
}
