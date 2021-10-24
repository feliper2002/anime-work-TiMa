import 'dart:ui';

import 'package:anime_work_time_management/core/app_settings.dart';
import 'package:anime_work_time_management/modules/info/controllers/info_controller.dart';
import 'package:anime_work_time_management/shared/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AboutAppPage extends StatelessWidget {
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
          'About App',
          style: TextStyle(color: mainColor),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            Text(
              'This app was developed for studies interests about the used technology.\n\nDeveloped by: Felipe Ribeiro\n\nAnime Work - Time Management (TiMa) is an app that helps you to divide a time for your work and studies and the necessary time to watch an anime episode.',
              style: TextStyle(
                fontSize: 16,
                color: mainColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            Row(
              children: [
                for (var media in controller.links)
                  Container(
                    child: Expanded(
                      child: GestureDetector(
                        onTap: () async {
                          await controller.launchURL(media['link']);
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  colorFilter: ColorFilter.mode(
                                      mainColor, BlendMode.dstIn),
                                  image: Image.asset(media['icon_path']).image,
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              media['title'],
                              style: TextStyle(color: mainColor, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
