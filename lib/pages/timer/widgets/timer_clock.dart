import 'dart:math';

import 'package:anime_work_time_management/pages/timer/controllers/timer_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:percent_indicator/circular_percent_indicator.dart';

class TimerClock extends StatefulWidget {
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
      return Container(
        child: CircularPercentIndicator(
          percent: controller.percent!,
          lineWidth: 15,
          radius: clockSize,
          arcType: ArcType.FULL,
          animation: true,
          animateFromLastPercent: true,
          circularStrokeCap: CircularStrokeCap.round,
          linearGradient: LinearGradient(
            colors: [Colors.blue, Colors.blueGrey],
          ),
          center: Text(
            "30:00",
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      );
    });
  }
}
