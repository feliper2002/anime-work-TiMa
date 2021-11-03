class InfoController {
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
      'title': 'Background art & drawing (Dark mode)',
      'name': 'Victoria Emilly',
    },
  ];

  List<Map<String, dynamic>> links = [
    {
      'title': 'feliper2002',
      'icon_path': 'assets/images/github-logo.png',
      'link': 'https://github.com/feliper2002',
    },
    {
      'title': '@feliper_dev',
      'icon_path': 'assets/images/twitter-logo.png',
      'link': 'https://twitter.com/feliper_dev',
    },
  ];
}
