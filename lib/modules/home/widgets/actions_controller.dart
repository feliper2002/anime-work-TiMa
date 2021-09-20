import 'package:anime_work_time_management/modules/home/controllers/timer_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'action_button.dart';

class ActionsController extends StatelessWidget {
  final Size? size;
  final bool? mode;

  ActionsController({this.size, this.mode});

  final controller = Modular.get<TimerController>();

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ActionButton(size, mode),
                Observer(builder: (_) {
                  return ActionButton(
                    size,
                    mode,
                    customIcon: Icons.replay_outlined,
                    onClick: controller.restart,
                    enable: !controller.started!,
                  );
                }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
