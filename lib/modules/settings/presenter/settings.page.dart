import 'package:anime_work_time_management/core/app_settings.dart';
import 'package:anime_work_time_management/modules/settings/presenter/widgets/settings_btn.dart';
import 'package:anime_work_time_management/shared/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({Key? key}) : super(key: key);

  final settings = Modular.get<SettingsController>();

  @override
  Widget build(BuildContext context) {
    bool? mode = settings.switchMode!;
    Color? bgColor = (mode ? Colors.white : AppColors.mainTimerColorDark);
    Color? mainColor = (mode ? AppColors.mainTimerColorLight : Colors.white);
    return Scaffold(
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
            SettingsButton(
              'Study/Work time:',
              mode,
              minutes: settings.studyMinutes,
              // onClick: () async {
              //   await settings.setWorkStudyPrefs(60);
              // },
            ),
            SettingsButton(
              'Watch anime time:',
              mode,
              minutes: settings.animeMinutes,
              // onClick: () async {
              //   await settings.setWatchAnimePrefs(30);
              // },
            ),
          ],
        ),
      ),
    );
  }
}
