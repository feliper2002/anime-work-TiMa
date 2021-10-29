import 'package:anime_work_time_management/core/app_settings.dart';
import 'package:anime_work_time_management/modules/settings/presenter/widgets/reset_btn.dart';
import 'package:anime_work_time_management/modules/settings/presenter/widgets/settings_btn.dart';
import 'package:anime_work_time_management/shared/theme/colors.dart';
import 'package:anime_work_time_management/shared/utils/enum_classes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({Key? key}) : super(key: key);

  final settings = Modular.get<SettingsController>();

  @override
  Widget build(BuildContext context) {
    bool? mode = settings.switchMode!;
    Color? bgColor = (mode ? Colors.white : AppColors.mainTimerColorDark);
    Color? mainColor = (mode ? AppColors.mainTimerColorLight : Colors.white);
    return WillPopScope(
      onWillPop: () async {
        await settings.startApplicationTimer();
        return true;
      },
      child: Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: bgColor,
          iconTheme: IconThemeData(
            color: mainColor,
          ),
          centerTitle: false,
          title: Text(
            'Settings',
            style: TextStyle(color: mainColor),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Column(
            children: [
              Observer(builder: (_) {
                return SettingsButton(
                  'Study/Work time:',
                  mode,
                  minutes: settings.studyMinutes,
                  type: TimerType.work,
                );
              }),
              Observer(builder: (_) {
                return SettingsButton(
                  'Watch anime time:',
                  mode,
                  minutes: settings.animeMinutes,
                  type: TimerType.watchAnime,
                );
              }),
              const SizedBox(height: 40),
              Observer(builder: (_) {
                return ResetButton(mode, onTap: () async {
                  await settings.resetPreferences();
                });
              }),
            ],
          ),
        ),
      ),
    );
  }
}
