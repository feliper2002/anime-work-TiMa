import 'dart:ui';

import 'package:anime_work_time_management/pages/home/controllers/home_controller.dart';
import 'package:anime_work_time_management/pages/home/widgets/timer_clock.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'widgets/actions_controller.dart';

class HomePage extends StatelessWidget {
  final controller = HomeController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaY: 4, sigmaX: 4),
            child: Observer(builder: (_) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.asset(controller.backgroundImage!).image,
                  ),
                ),
              );
            }),
          ),
          Center(
            child: Observer(builder: (_) {
              return TimerClock(
                mode: controller.mode,
              );
            }),
          ),
          Observer(builder: (_) {
            return Positioned(
              top: 70,
              right: 10,
              child: GestureDetector(
                onTap: () {
                  controller.changeSwitchMode(1);
                },
                child: Container(
                  height: 20,
                  width: 20,
                  color: Colors.red,
                ),
              ),
            );
          }),
          Observer(builder: (_) {
            return ActionsController(size: size, mode: controller.mode);
          }),
        ],
      ),
    );
  }
}
