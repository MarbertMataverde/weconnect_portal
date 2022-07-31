import 'package:flutter/material.dart';
import 'package:weconnect_portal/global/widget/widget_global_text.dart';

Future<dynamic> globalDialog({
  required BuildContext context,
  required String content,

  /// Title of the dialog
  /// if title is empty the default value will be 'Something went wrong'
  String? title,

  /// onPressed function
  /// if empty the default fucntion will be [() => Navigator.pop(context)]
  Function()? onPressed,

  /// Action Button Text
  /// if empty the default text will be 'Close'
  String? actionText,
}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actionsAlignment: MainAxisAlignment.center,
        title: globalText(
          text: title ?? 'Something went wrong',
          textAlign: TextAlign.center,
          color: Theme.of(context).textTheme.bodyMedium!.color,
        ),
        content: globalText(
          text: content,
          textAlign: TextAlign.center,
          color: Theme.of(context).textTheme.bodyMedium!.color,
        ),
        actions: [
          TextButton(
            style:
                TextButton.styleFrom(primary: Theme.of(context).primaryColor),
            onPressed: onPressed ?? (() => Navigator.pop(context)),
            child: Text(actionText ?? 'Ok'),
          ),
        ],
      );
    },
  );
}
