import 'package:anime_work_time_management/pages/home/home.page.dart';
import 'package:flutter/material.dart';

void main() => runApp(InitApp());

class InitApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Anime-Work TiMa',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/timer': (context) => Container(),
        '/info': (context) => Container(),
      },
    );
  }
}
