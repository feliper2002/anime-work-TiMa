import 'package:anime_work_time_management/shared/theme/colors.dart';
import 'package:flutter/material.dart';

class TimerTypeDialog extends StatelessWidget {
  final bool? mode;

  TimerTypeDialog({this.mode});

  Color? get textColor =>
      (mode! ? AppColors.mainTimerColorLight : Colors.white);
  Color? get backgroundColor =>
      (mode! ? Colors.white : AppColors.mainTimerColorDark);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      padding: const EdgeInsets.only(top: 17, bottom: 25, left: 14, right: 14),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Editar tempo de duração',
            style: TextStyle(
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
