import 'dart:math';

import 'package:anime_work_time_management/pages/home/controllers/timer_controller.dart';
import 'package:anime_work_time_management/shared/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:percent_indicator/circular_percent_indicator.dart';

class TimerClock extends StatefulWidget {
  final int? mode;

  TimerClock({this.mode = 0});

  @override
  _TimerClockState createState() => _TimerClockState();
}

class _TimerClockState extends State<TimerClock> {
  final controller = TimerController();
  final start = 0.toDouble();
  final end = 2 * pi;

  @override
  Widget build(BuildContext context) {
    final clockSize = 300.toDouble();
    return Observer(builder: (_) {
      final mainColor = controller.getTimerColor(widget.mode!);
      return Container(
        child: CircularPercentIndicator(
          header: Container(
            child: Text(controller.getTimerHeader()!,
                style: TextStyle(
                  fontSize: 26,
                  color: mainColor,
                  fontWeight: FontWeight.w900,
                )),
            margin: const EdgeInsets.symmetric(vertical: 12),
          ),
          percent: controller.percent!,
          lineWidth: 15,
          radius: clockSize,
          arcType: ArcType.FULL,
          animation: true,
          animateFromLastPercent: true,
          circularStrokeCap: CircularStrokeCap.round,
          progressColor: mainColor,
          center: Text(
            "30:00",
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.w700,
              color: mainColor,
            ),
          ),
        ),
      );
    });
  }
}
