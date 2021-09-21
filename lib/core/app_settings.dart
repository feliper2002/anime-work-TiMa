import 'package:anime_work_time_management/shared/utils/enum_classes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:mobx/mobx.dart';
part 'app_settings.g.dart';

class SettingsController = _SettingsControllerBase with _$SettingsController;

abstract class _SettingsControllerBase with Store {
  @observable
  Map<String, dynamic> timer = {
    'studyMinutes': 50,
    'animeMinutes': 25,
    'mode': SwitchMode.day,
  };

  _SettingsControllerBase() {
    _startSettings();
  }

  _startSettings() async {
    await _readPreferences();
  }

  @action
  _readPreferences() async {
    final _preferences = await SharedPreferences.getInstance();
    final studyMinutes = _preferences.getInt('studyMinutes') ?? 50;
    final animeMinutes = _preferences.getInt('animeMinutes') ?? 25;
    final mode = _preferences.getBool('mode') ?? SwitchMode.day;

    timer = {
      'studyMinutes': studyMinutes,
      'animeMinutes': animeMinutes,
      'mode': mode,
    };

    print(timer);
  }

  @action
  setSwitchMode() async {
    final _preferences = await SharedPreferences.getInstance();
    timer['mode'] = !timer['mode'];
    await _preferences.setBool('mode', timer['mode']);
    await _readPreferences();
  }

  @computed
  bool? get switchMode => timer['mode'];

  @action
  setWatchAnimePrefs(int minutes) async {
    final _preferences = await SharedPreferences.getInstance();
    await _preferences.setInt('animeMinutes', minutes);
    await _readPreferences();
  }

  @action
  setWorkStudyPrefs(int minutes) async {
    final _preferences = await SharedPreferences.getInstance();
    await _preferences.setInt('studyMinutes', minutes);
    await _readPreferences();
  }
}
