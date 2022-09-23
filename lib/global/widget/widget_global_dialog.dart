import 'package:flutter/material.dart';
import 'package:weconnect_portal/global/widget/widget_global_sizedbox.dart';
import 'package:weconnect_portal/global/widget/widget_global_text.dart';

Future<dynamic> globalDialog({
  required BuildContext context,
  required String content,

  /// onPressed function
  /// if empty the default fucntion will be [() => Navigator.pop(context)]
  Function()? onPressed,

  /// Action Button Text
  /// if empty the default text will be 'Close'
  String? actionText,
}) {
  return showDialog(
    context: context,
    barrierColor: Colors.black.withOpacity(0.7),
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            globalText(
              text: content,
              color: Theme.of(context).textTheme.bodyMedium!.color,
              textScaleFactor: 1.1,
              textAlign: TextAlign.center,
            ),
            sizedBox(),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).primaryColor, backgroundColor: const Color(0xff323645),
              ),
              onPressed: onPressed ?? () => Navigator.pop(context),
              child: globalText(
                text: actionText ?? 'Okay',
                color: Theme.of(context).textTheme.bodyMedium!.color,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      );
    },
  );
}
