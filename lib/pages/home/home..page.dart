import 'dart:ui';

import 'package:anime_work_time_management/pages/home/controllers/home_controller.dart';
import 'package:anime_work_time_management/pages/home/widgets/timer_clock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomePage extends StatelessWidget {
  final controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (_) {
        return Stack(
          children: [
            ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaY: 4, sigmaX: 4),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.asset(controller.getBackgroundImage()!).image,
                  ),
                ),
              ),
            ),
            Center(
              child: TimerClock(
                mode: controller.mode,
              ),
            ),
          ],
        );
      }),
    );
  }
}
