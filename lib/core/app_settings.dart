import 'package:anime_work_time_management/shared/utils/enum_classes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:mobx/mobx.dart';
part 'app_settings.g.dart';

class SettingsController = SettingsControllerBase with _$SettingsController;

abstract class SettingsControllerBase with Store {
  @observable
  Map<String, dynamic> timer = {
    'studyMinutes': 50,
    'studySeconds': 0,
    'animeMinutes': 25,
    'animeSeconds': 0,
    'mode': SwitchMode.day,
  };

  SettingsControllerBase() {
    _startSettings();
  }

  _startSettings() async {
    await _readPreferences();
  }

  @action
  _readPreferences() async {
    final _preferences = await SharedPreferences.getInstance();
    final studyMinutes = _preferences.getInt('studyMinutes') ?? 50;
    final studySeconds = _preferences.getInt('studySeconds') ?? 0;
    final animeMinutes = _preferences.getInt('animeMinutes') ?? 25;
    final animeSeconds = _preferences.getInt('animeSeconds') ?? 0;
    final mode = _preferences.getBool('mode') ?? SwitchMode.day;

    timer = {
      'studyMinutes': studyMinutes,
      'studySeconds': studySeconds,
      'animeMinutes': animeMinutes,
      'animeSeconds': animeSeconds,
      'mode': mode,
    };

    print(timer);
  }

  @action
  setSwitchMode(bool? mode) async {
    final _preferences = await SharedPreferences.getInstance();
    await _preferences.setBool('mode', mode!);
    await _readPreferences();
  }

  @computed
  bool? get switchMode => timer['mode'];

  @action
  setWatchAnimePrefs(int minutes, int seconds) async {
    final _preferences = await SharedPreferences.getInstance();
    await _preferences.setInt('animeMinutes', minutes);
    await _preferences.setInt('animeSeconds', seconds);
    await _readPreferences();
  }

  @action
  setWorkStudyPrefs(int minutes, int seconds) async {
    final _preferences = await SharedPreferences.getInstance();
    await _preferences.setInt('studyMinutes', minutes);
    await _preferences.setInt('studySeconds', seconds);
    await _readPreferences();
  }
}
