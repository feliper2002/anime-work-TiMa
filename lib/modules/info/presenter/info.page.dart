import 'package:anime_work_time_management/core/app_settings.dart';
import 'package:anime_work_time_management/modules/home/controllers/timer_controller.dart';
import 'package:anime_work_time_management/modules/info/controllers/info_controller.dart';
import 'package:anime_work_time_management/shared/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class InfoPage extends StatelessWidget {
  final settings = Modular.get<SettingsController>();
  final controller = Modular.get<InfoController>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
          'Info',
          style: TextStyle(color: mainColor),
        ),
      ),
      body: ListView.builder(
        itemCount: controller.infoPage.length,
        itemBuilder: (_, index) {
          final info = controller.infoPage[index];
          return GestureDetector(
            onTap: () async {
              await Modular.to.pushNamed(info['route']);
            },
            child: Container(
              height: size.height * .06,
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: mainColor, width: 2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                info['name'],
                style: TextStyle(
                    color: mainColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),
          );
        },
      ),
    );
  }
}
