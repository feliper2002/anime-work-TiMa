import 'package:anime_work_time_management/modules/home/controllers/timer_controller.dart';
import 'package:anime_work_time_management/shared/functions/show_dialog.dart';
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
      child: Stack(
        children: [
          Container(
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
          Positioned(
            top: 8,
            right: 10,
            child: IconButton(
              padding: const EdgeInsets.all(4),
              icon: Container(
                alignment: Alignment.center,
                child:
                    Icon(Icons.timer, color: controller.getTimerColor(!mode!)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    width: 1.8,
                    color: controller.getTimerColor(!mode!)!,
                  ),
                ),
              ),
              iconSize: 28,
              onPressed: () async {
                await showCustomDialog(
                  context,
                  isDismissible: true,
                  dialog: Container(
                    color: controller.getTimerColor(mode!),
                    padding: const EdgeInsets.only(
                        top: 17, bottom: 25, left: 14, right: 14),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Editar tempo de duração',
                          style: TextStyle(
                            color: controller.getTimerColor(!mode!),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
