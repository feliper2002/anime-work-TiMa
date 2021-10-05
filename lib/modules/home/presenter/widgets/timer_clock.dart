import 'package:anime_work_time_management/modules/home/controllers/timer_controller.dart';
import 'package:anime_work_time_management/shared/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:percent_indicator/circular_percent_indicator.dart';

class TimerClock extends StatefulWidget {
  final bool? mode;

  TimerClock({this.mode = false});

  @override
  _TimerClockState createState() => _TimerClockState();
}

class _TimerClockState extends State<TimerClock> {
  final controller = Modular.get<TimerController>();

  @override
  void initState() {
    controller.getStartTimerValues();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final clockSize = 300.toDouble();

    return FutureBuilder(
      future: controller.getStartTimerValues(),
      builder: (_, snapshot) {
        return Observer(builder: (_) {
          final mainColor = controller.getTimerColor(widget.mode!);
          return CircularPercentIndicator(
            header: Container(
              child: Text(controller.timerHeader!,
                  style: TextStyle(
                    fontSize: 26,
                    color: mainColor,
                    fontWeight: FontWeight.w900,
                  )),
              margin: const EdgeInsets.symmetric(vertical: 12),
            ),
            percent: controller.percent,
            lineWidth: 15,
            radius: clockSize,
            animation: true,
            animateFromLastPercent: true,
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: widget.mode!
                ? AppColors.timerProgressBarLight
                : AppColors.timerProgressBarDark,
            backgroundColor: widget.mode!
                ? AppColors.timerProgressBgLight
                : AppColors.timerProgressBgDark,
            center: Observer(builder: (_) {
              return Text(
                "${controller.timerMinutes.toString().padLeft(2, '0')}:${controller.seconds!.toString().padLeft(2, '0')}",
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w700,
                  color: mainColor,
                ),
              );
            }),
          );
        });
      },
    );
  }
}
