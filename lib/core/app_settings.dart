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
    'minutes': 50,
    'mode': SwitchMode.day,
    'type': TimerType.work,
  };

  _SettingsControllerBase() {
    /// Initialize settings by calling [_readPreferences] function
    _startSettings();
  }

  _startSettings() async {
    // It's called [every] single app initialization with the actual values locally stored
    await _readPreferences();
  }

  @action
  _readPreferences() async {
    /// Get all [intances] from `SharedPreferences` and store them in a variable
    final _preferences = await SharedPreferences.getInstance();

    /// Get all the respective [values] from preferences [instaces]
    ///
    /// Call _preferences with a method that receive as parameter the same [timer] map key name
    ///
    /// In case of [null] value, it return a value by {??} [nullable verification]
    final studyMinutes = _preferences.getInt('studyMinutes') ?? 50;
    final animeMinutes = _preferences.getInt('animeMinutes') ?? 25;
    final mode = _preferences.getBool('mode') ?? SwitchMode.day;
    final type = _preferences.getInt('type') ?? TimerType.work;
    final minutes = _preferences.getInt('minutes') ??
        (type == 0 ? studyMinutes : animeMinutes);

    // timer map that contains the same [key name] as the [preferences instance names]
    //
    // the respective [key name] receive the [preferences instace value]
    timer = {
      'studyMinutes': studyMinutes,
      'animeMinutes': animeMinutes,
      'minutes': minutes,
      'mode': mode,
      'type': type,
    };

    print(timer);

    /// Everytime this function is called, the [timer] map updates his respective values
    /// based at setter functions with the [new values]
    ///
    /// That values are stored at [mobile local storage]
  }

  @action
  setSwitchMode() async {
    final _preferences = await SharedPreferences.getInstance();
    timer['mode'] = !timer['mode'];
    await _preferences.setBool('mode', timer['mode']);
    await _readPreferences();
  }

  @action
  setTimerType(int? type) async {
    final _preferences = await SharedPreferences.getInstance();
    await _preferences.setInt('type', type!);
    timer['type'] = _preferences.getInt('type');
    await _readPreferences();
  }

  @computed
  bool? get switchMode => timer['mode'];

  @computed
  int? get timerType => timer['type'];

  @computed
  int? get minutes => timer['minutes'];

  @action
  setWatchAnimePrefs(int minutes) async {
    final _preferences = await SharedPreferences.getInstance();
    await _preferences.setInt('animeMinutes', minutes);
    await _readPreferences();
  }

  @action
  setMinutes(int minutes) async {
    final _preferences = await SharedPreferences.getInstance();
    await _preferences.setInt('minutes', minutes);
    await _readPreferences();
  }

  @action
  setWorkStudyPrefs(int minutes) async {
    final _preferences = await SharedPreferences.getInstance();
    await _preferences.setInt('studyMinutes', minutes);
    await _readPreferences();
  }
}
