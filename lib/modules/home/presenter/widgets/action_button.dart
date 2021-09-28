import 'package:anime_work_time_management/modules/home/controllers/timer_controller.dart';
import 'package:anime_work_time_management/shared/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ActionButton extends StatelessWidget {
  final Size? size;
  final bool? mode;
  final Function? onClick;
  final IconData? customIcon;
  final bool? enable;

  ActionButton(this.size, this.mode,
      {this.onClick, this.customIcon, this.enable = true});

  final controller = Modular.get<TimerController>();

  Color? get _color => controller.getTimerColor(!mode!);

  @override
  Widget build(BuildContext context) {
    final buttonSize = size!.width * .16;

    return Observer(builder: (_) {
      return Visibility(
        visible: enable!,
        child: GestureDetector(
          onTap: onClick == null
              ? () {
                  if (!controller.started!) {
                    controller.start();
                  } else {
                    controller.stop();
                  }
                }
              : onClick as void Function(),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 6),
            height: buttonSize,
            width: buttonSize,
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: mode!
                  ? Colors.grey[200]!.withOpacity(.2)
                  : Colors.blue[900]!.withOpacity(.2),
              border: Border.all(
                  color: mode!
                      ? AppColors.actionButtonColorLight
                      : AppColors.actionButtonColorDark,
                  width: 2),
            ),
            child: customIcon == null
                ? Icon(controller.started! ? Icons.pause : Icons.play_arrow,
                    color: mode!
                        ? AppColors.actionButtonColorLight
                        : AppColors.actionButtonColorDark)
                : Icon(customIcon,
                    color: mode!
                        ? AppColors.actionButtonColorLight
                        : AppColors.actionButtonColorDark),
          ),
        ),
      );
    });
  }
}
