import 'dart:ui';

import 'package:anime_work_time_management/core/app_settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'controllers/home_controller.dart';
import 'widgets/actions_controller.dart';
import 'widgets/custom_switch.dart';
import 'widgets/timer_clock.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Modular.get<HomeController>();
  final settings = Modular.get<SettingsController>();

  Map<String, dynamic>? timer;

  @override
  void initState() {
    timer = settings.timer;
    super.initState();
  }

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
                    image: Image.asset(
                            controller.backgroundImage(settings.switchMode)!)
                        .image,
                  ),
                ),
              );
            }),
          ),
          Center(
            child: Observer(builder: (_) {
              return TimerClock(
                mode: settings.switchMode,
              );
            }),
          ),
          Observer(builder: (_) {
            return Positioned(
              top: 70,
              right: 10,
              child: GestureDetector(
                onTap: () async {
                  await settings.setSwitchMode();
                },
                child: CustomSwitch(mode: settings.switchMode),
              ),
            );
          }),
          Positioned(
            top: 70,
            left: 20,
            child: Row(
              children: [
                Icon(Icons.info_outline, color: Colors.white),
                SizedBox(width: 22),
                Icon(Icons.settings, color: Colors.white),
              ],
            ),
          ),
          Observer(builder: (_) {
            return ActionsController(size: size, mode: settings.switchMode);
          }),
        ],
      ),
    );
  }
}
