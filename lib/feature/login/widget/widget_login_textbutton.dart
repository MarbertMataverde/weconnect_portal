import 'package:flutter/material.dart';
import 'package:weconnect_portal/feature/create_account/view/view_create_account.dart';
import 'package:weconnect_portal/feature/forgot_password/view/view_forgot_password.dart';
import 'package:weconnect_portal/global/widget/widget_global_text.dart';

Widget loginForgotPassword({
  required BuildContext context,
}) {
  return Align(
    alignment: Alignment.centerRight,
    child: TextButton(
      onPressed: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (routeContext) => const ForgotPassword(),
        ),
      ),
      style: TextButton.styleFrom(
        foregroundColor: Theme.of(context).primaryColor,
      ),
      child: globalText(
        text: 'Reset Password',
        fontWeight: FontWeight.w300,
      ),
    ),
  );
}

Widget loginCreate({required BuildContext context}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      globalText(
        text: 'Dont have an account?',
        fontWeight: FontWeight.w300,
      ),
      TextButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (routeContext) => const CreateAccount(),
          ),
        ),
        child: globalText(
          text: 'Create',
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.w300,
        ),
      ),
    ],
  );
}
