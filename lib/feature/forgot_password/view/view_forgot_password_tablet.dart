import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:weconnect_portal/global/widget/widget_global_appbar.dart';
import 'package:weconnect_portal/global/widget/widget_global_sizedbox.dart';
import 'package:weconnect_portal/global/widget/widget_global_text.dart';
import 'package:weconnect_portal/global/widget/widget_global_textbutton.dart';
import 'package:weconnect_portal/global/widget/widget_global_textformfield.dart';

class ForgotPasswordTablet extends StatelessWidget {
  const ForgotPasswordTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: globalAppBar(
        context: context,
        onPressed: () => Navigator.pop(context),
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              globalText(text: 'Forgot your password?', textScaleFactor: 2),
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
      ),
    );
  }
}
