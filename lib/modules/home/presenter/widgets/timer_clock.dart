import 'package:anime_work_time_management/modules/home/controllers/timer_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
    final mainColor = controller.getTimerColor(widget.mode!);
    return Observer(builder: (_) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Text(controller.timerHeader!,
                style: TextStyle(
                  fontSize: 26,
                  color: mainColor,
                  fontWeight: FontWeight.w900,
                )),
            margin: const EdgeInsets.symmetric(vertical: 12),
          ),
          SizedBox(height: 20),
          Observer(builder: (_) {
            return Text(
              "${controller.timerMinutes.toString().padLeft(2, '0')}:${controller.seconds!.toString().padLeft(2, '0')}",
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.w700,
                color: mainColor,
              ),
            );
          }),
        ],
      );
    });
  }
}
