import 'package:flutter/material.dart';

class ResetButton extends StatelessWidget {
  final Function? onTap;

  ResetButton({this.onTap});
  @override
  Widget build(BuildContext context) {
    Color? mainColor = Colors.red;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      child: OutlinedButton(
        onPressed: onTap as void Function(),
        child: Row(
          children: [
            Text(
              'Reset app preferences',
              style: TextStyle(
                  color: mainColor, fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const Spacer(),
            Icon(Icons.warning_amber, color: mainColor, size: 16),
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
