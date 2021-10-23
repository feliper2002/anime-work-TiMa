import 'package:anime_work_time_management/core/app_settings.dart';
import 'package:anime_work_time_management/modules/info/controllers/info_controller.dart';
import 'package:anime_work_time_management/shared/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CreditsPage extends StatelessWidget {
  final settings = Modular.get<SettingsController>();
  final controller = Modular.get<InfoController>();

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
          'Credits',
          style: TextStyle(color: mainColor),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        child: ListView.separated(
          itemCount: controller.credits.length,
          separatorBuilder: (_, index) {
            return Divider(
              height: 30,
              thickness: 1,
              indent: 20,
              endIndent: 20,
              color: mainColor,
            );
          },
          itemBuilder: (_, index) {
            final credit = controller.credits[index];
            return Container(
              child: Column(
                children: [
                  Text(credit['title'],
                      style: TextStyle(color: mainColor, fontSize: 20)),
                  const SizedBox(height: 5),
                  Text(credit['name'], style: TextStyle(color: mainColor)),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
