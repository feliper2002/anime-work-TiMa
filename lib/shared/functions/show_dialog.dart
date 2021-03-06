import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<void> showCustomDialog(
  BuildContext? context, {
  required Widget? dialog,
  bool? isDismissible,
  Color? color,
  Widget? title,
  bool? scrollable,
}) async {
  // It creates a custom [dialog] that 'll follow the same pattern structure at all app screens
  //
  // This function return is differenciated by [platforms]: {Android} and {iOS}
  if (Platform.isAndroid) {
    return await showDialog(
      context: context!,
      barrierDismissible: isDismissible ?? false,
      builder: (_) {
        return AlertDialog(
          elevation: 3,
          title: title ?? null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          contentPadding: EdgeInsets.zero,
          scrollable: scrollable ?? false,
          content: dialog!,
        );
      },
    );
  } else if (Platform.isIOS) {
    return await showCupertinoDialog(
      context: context!,
      barrierDismissible: isDismissible ?? false,
      builder: (_) {
        return AlertDialog(
          elevation: 3,
          title: title ?? null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          contentPadding: EdgeInsets.zero,
          scrollable: scrollable ?? false,
          content: dialog!,
        );
      },
    );
  }
}
