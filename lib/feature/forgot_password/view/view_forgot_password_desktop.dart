import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:weconnect_portal/global/widget/widget_global_sizedbox.dart';
import 'package:weconnect_portal/global/widget/widget_global_text.dart';
import 'package:weconnect_portal/global/widget/widget_global_textbutton.dart';
import 'package:weconnect_portal/global/widget/widget_global_textformfield.dart';

class ForgotPasswordDesktop extends StatelessWidget {
  const ForgotPasswordDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: 450,
            maxWidth: 500,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              globalText(text: 'Forgot your password?', textScaleFactor: 2.3),
              globalText(
                text:
                    'Enter your registered email below\nto receive password reset instruction',
                textScaleFactor: 1.2,
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
      ),
    );
  }
}
