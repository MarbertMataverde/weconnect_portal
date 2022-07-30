import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:weconnect_portal/global/widget/widget_global_text.dart';
import 'package:weconnect_portal/global/widget/widget_global_textbutton.dart';
import 'package:weconnect_portal/global/widget/widget_global_textformfield.dart';

class ForgotPasswordPhone extends StatelessWidget {
  const ForgotPasswordPhone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.1),
        child: Center(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                globalText(text: 'Forgot your password?', textScaleFactor: 2),
                globalText(
                  text:
                      'Enter your registered email below\nto receive password reset instruction',
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w100,
                ),
                globalTextFormField(
                  context: context,
                  hint: 'Email Address',
                  textInputType: TextInputType.emailAddress,
                  prefixIcon: Icon(
                    Iconsax.sms,
                    color: Theme.of(context).textTheme.bodyMedium!.color,
                  ),
                ),
                globalTextButton(
                  context: context,
                  text: 'Send',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
