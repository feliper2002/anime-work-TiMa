import 'package:anime_work_time_management/core/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ResetDialog extends StatelessWidget {
  final Color? color;
  final Color? textColor;

  ResetDialog(this.color, this.textColor);

  final settings = Modular.get<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.only(top: 17, bottom: 25, left: 10, right: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Reset app preferences?',
            style: TextStyle(
              color: textColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'This action will clear all app preferences.',
            style: TextStyle(
              color: textColor,
              fontSize: 15,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Observer(builder: (_) {
                return OutlinedButton(
                  onPressed: () async {
                    await settings.resetPreferences();
                    Modular.to.pop();
                  },
                  child: Text(
                    'Confirm',
                    style: TextStyle(
                      color: textColor,
                      fontSize: 16,
                    ),
                  ),
                  style: ButtonStyle(
                      alignment: Alignment.centerLeft,
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(horizontal: 12)),
                      side: MaterialStateProperty.all(
                          BorderSide(width: 2, color: textColor!)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ))),
                );
              }),
              OutlinedButton(
                onPressed: () {
                  Modular.to.pop();
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                  ),
                ),
                style: ButtonStyle(
                    alignment: Alignment.centerLeft,
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(horizontal: 12)),
                    side: MaterialStateProperty.all(
                        BorderSide(width: 2, color: textColor!)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ))),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
