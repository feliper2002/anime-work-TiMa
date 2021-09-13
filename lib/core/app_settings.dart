import 'package:anime_work_time_management/shared/utils/enum_classes.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSettings extends ChangeNotifier {
  late SharedPreferences _preferences;

  Map<String, dynamic> timer = {
    'studyMinutes': 50,
    'studySeconds': 0,
    'animeMinutes': 25,
    'animeSeconds': 0,
    'mode': SwitchMode.day,
  };

  AppSettings() {
    _startSettings();
  }

  _startSettings() async {
    await _startPreferences();
    await _readPreferences();
  }

  Future<void> _startPreferences() async {
    _preferences = await SharedPreferences.getInstance();
  }

  _readPreferences() async {
    final studyMinutes = _preferences.getInt('minutes') ?? 50;
    final studySeconds = _preferences.getInt('seconds') ?? 0;
  }
}
