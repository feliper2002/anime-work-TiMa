import 'package:anime_work_time_management/pages/home/controllers/timer_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ActionsController extends StatelessWidget {
  final Size? size;
  final int? mode;

  ActionsController({this.size, this.mode});

  final controller = TimerController();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: size!.height * .23,
        decoration: BoxDecoration(
          color: controller.getTimerColor(mode!),
          borderRadius: BorderRadius.vertical(top: Radius.circular(26)),
        ),
      ),
    );
  }
}
