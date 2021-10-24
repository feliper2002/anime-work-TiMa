import 'package:anime_work_time_management/core/app_settings.dart';
import 'package:anime_work_time_management/modules/info/controllers/info_controller.dart';
import 'package:anime_work_time_management/shared/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class InfoPage extends StatelessWidget {
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
          'Info',
          style: TextStyle(color: mainColor),
        ),
      ),
      body: ListView.builder(
        itemCount: controller.infoPage.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (_, index) {
          final info = controller.infoPage[index];
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
            child: OutlinedButton(
              onPressed: () async {
                await Modular.to.pushNamed(info['route']);
              },
              child: Row(
                children: [
                  Text(
                    info['name'],
                    style: TextStyle(
                        color: mainColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  Icon(Icons.open_in_new, color: mainColor, size: 18),
                ],
              ),
              style: ButtonStyle(
                  alignment: Alignment.centerLeft,
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 12)),
                  side: MaterialStateProperty.all(
                      BorderSide(width: 2, color: mainColor)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ))),
            ),
          );
        },
      ),
    );
  }
}
