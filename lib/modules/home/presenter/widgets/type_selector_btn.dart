import 'package:anime_work_time_management/core/app_settings.dart';
import 'package:anime_work_time_management/modules/home/controllers/timer_controller.dart';
import 'package:anime_work_time_management/shared/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TypeSelectorBtn extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final int? type;

  TypeSelectorBtn({Key? key, this.text, this.icon, this.type})
      : super(key: key);

  final controller = Modular.get<SettingsController>();
  final timer = Modular.get<TimerController>();

  bool? isSelected() {
    if (controller.timerType == type) {
      return true;
    }
    return false;
  }

  Color? bgColor() {
    if (isSelected()!) {
      return controller.switchMode!
          ? AppColors.mainTimerColorLight
          : AppColors.timerProgressBarDark;
    } else {
      return !controller.switchMode! ? Colors.transparent : Colors.transparent;
    }
  }

  Color? insideColor() {
    if (isSelected()!) {
      return controller.switchMode! ? Colors.white : Colors.black;
    } else {
      return !controller.switchMode!
          ? Colors.white
          : AppColors.mainTimerColorLight;
    }
  }

  @override
  Widget build(BuildContext context) {
    Color? borderColor = (!controller.switchMode!
        ? AppColors.actionButtonColorLight
        : AppColors.actionButtonColorDark);
    final size = MediaQuery.of(context).size;
    return Observer(builder: (_) {
      return GestureDetector(
        onTap: () async {
          await controller.setTimerType(type);
          await timer.restart();
          Modular.to.pop();
        },
        child: Container(
          height: size.width * .3,
          width: size.width * .3,
          alignment: Alignment.center,
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          decoration: BoxDecoration(
            color: bgColor(),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              width: 2,
              color: borderColor,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Icon(icon, color: insideColor()),
              ),
              Text(
                text!,
                style: TextStyle(
                    color: insideColor(), fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    });
  }
}
