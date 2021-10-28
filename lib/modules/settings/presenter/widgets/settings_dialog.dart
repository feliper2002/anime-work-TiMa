import 'package:anime_work_time_management/core/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

class SettingsDialog extends StatelessWidget {
  final String? title;
  final Color? color;
  final Color? textColor;

  SettingsDialog({this.title, this.color, this.textColor});

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
            '$title Settings',
            style: TextStyle(
              color: textColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          TextFormField(
            style: TextStyle(color: textColor),
            decoration: InputDecoration(
              labelText: 'Minutes',
              labelStyle: TextStyle(color: textColor),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: textColor!),
              ),
            ),
            keyboardType: TextInputType.number,
            onChanged: (minutes) {
              if (minutes.isNotEmpty) {
                int? minInt = NumberFormat().parse(minutes).toInt();
                settings.setNewMinutes(minInt);
              }
            },
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Observer(builder: (_) {
                return OutlinedButton(
                  onPressed: () async {
                    if (title == "Study/Work time:") {
                      await settings.setWorkStudyPrefs(settings.newMinutes!);
                    } else if (title == "Watch anime time:") {
                      await settings.setWatchAnimePrefs(settings.newMinutes!);
                    }
                    Modular.to.pop();
                  },
                  child: Text(
                    'Confirmar',
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
                  'Cancelar',
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
