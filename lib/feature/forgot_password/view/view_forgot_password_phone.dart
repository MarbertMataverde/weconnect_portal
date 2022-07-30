import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:weconnect_portal/global/widget/widget_global_appbar.dart';
import 'package:weconnect_portal/global/widget/widget_global_sizedbox.dart';
import 'package:weconnect_portal/global/widget/widget_global_text.dart';
import 'package:weconnect_portal/global/widget/widget_global_textbutton.dart';
import 'package:weconnect_portal/global/widget/widget_global_textformfield.dart';

class ForgotPasswordPhone extends StatelessWidget {
  const ForgotPasswordPhone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: globalAppBar(
        context: context,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.020),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            globalText(text: 'Forgot your password?', textScaleFactor: 1.5),
            globalText(
              text:
                  'Enter your registered email below\nto receive password reset instruction',
              fontWeight: FontWeight.w100,
            ),
            sizedBox(),
            globalTextFormField(
              context: context,
              hint: 'Email Address',
              textInputType: TextInputType.emailAddress,
              prefixIcon: Icon(
                Iconsax.sms,
                color: Theme.of(context).textTheme.bodyMedium!.color,
              ),
            ),
            sizedBox(),
            globalTextButton(
              context: context,
              text: 'Send',
            )
          ],
        ),
      ),
    );
  }
}
