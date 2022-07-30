import 'package:flutter/material.dart';
import 'package:weconnect_portal/global/widget/widget_global_text.dart';

Widget buildControlsBuilder({
  required BuildContext context,
  required ControlsDetails details,
  required Function()? onSubmit,
  bool? enableSubmitButton,
}) {
  return Column(
    children: [
      Row(
        children: <Widget>[
          Visibility(
            visible: details.stepIndex != 3,
            replacement: builderTextButton(
              context: context,
              text: 'Submit',
              onPressed: enableSubmitButton == true ? onSubmit : null,
              textColor: enableSubmitButton == true
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).disabledColor,
            ),
            child: builderTextButton(
              context: context,
              text: 'Continue',
              onPressed: details.onStepContinue,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Visibility(
            visible: details.stepIndex != 0,
            child: builderTextButton(
              context: context,
              textColor: Theme.of(context).textTheme.bodyMedium!.color,
              text:
                  'Back to Step ${details.stepIndex == 0 ? details.stepIndex : details.stepIndex}',
              onPressed: details.onStepCancel,
            ),
          ),
        ],
      ),
    ],
  );
}

Widget builderTextButton({
  required BuildContext context,
  required String text,
  double? textScaleFactor,
  Function()? onPressed,
  Color? textColor,
}) {
  return SizedBox(
    height: 50,
    child: TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(2),
          ),
        ),
        primary: Theme.of(context).primaryColor,
        backgroundColor: const Color(0xff323645),
      ),
      child: globalText(
        text: text,
        textScaleFactor: textScaleFactor,
        fontWeight: FontWeight.w400,
        color: textColor ?? Theme.of(context).primaryColor,
      ),
    ),
  );
}
