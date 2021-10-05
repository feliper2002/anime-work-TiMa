import 'package:anime_work_time_management/modules/home/presenter/widgets/type_selector_btn.dart';
import 'package:anime_work_time_management/shared/theme/colors.dart';
import 'package:flutter/cupertino.dart';
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
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.only(top: 17, bottom: 25, left: 10, right: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'CHANGE TIMER TYPE',
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              TypeSelectorBtn(
                text: 'STUDY/WORK TIME',
                icon: Icons.work,
                type: 0,
              ),
              TypeSelectorBtn(
                text: 'WATCH ANIME TIME',
                icon: Icons.tv,
                type: 1,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
