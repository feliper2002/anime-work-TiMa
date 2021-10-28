import 'package:anime_work_time_management/modules/settings/presenter/widgets/settings_dialog.dart';
import 'package:anime_work_time_management/shared/functions/show_dialog.dart';
import 'package:anime_work_time_management/shared/theme/colors.dart';
import 'package:flutter/material.dart';

class SettingsButton extends StatelessWidget {
  final String? text;
  final int? minutes;
  final bool? mode;

  SettingsButton(this.text, this.mode, {this.minutes});
  Color? get backgroundColor =>
      (mode! ? Colors.white : AppColors.mainTimerColorDark);
  Color? get textColor =>
      (mode! ? AppColors.mainTimerColorLight : Colors.white);
  @override
  Widget build(BuildContext context) {
    Color? mainColor = (mode! ? AppColors.mainTimerColorLight : Colors.white);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      child: OutlinedButton(
        onPressed: () async {
          await showCustomDialog(context,
              dialog: SettingsDialog(
                  title: text, color: backgroundColor, textColor: textColor));
        },
        child: Row(
          children: [
            Text(
              text!,
              style: TextStyle(
                  color: mainColor, fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const Spacer(),
            Row(
              children: [
                Icon(Icons.alarm, color: mainColor, size: 16),
                const SizedBox(width: 6),
                Text(
                  '$minutes',
                  style: TextStyle(
                      color: mainColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ],
        ),
        style: ButtonStyle(
            alignment: Alignment.centerLeft,
            padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(horizontal: 12)),
            side: MaterialStateProperty.all(
                BorderSide(width: 2, color: mainColor)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ))),
      ),
    );
  }
}
