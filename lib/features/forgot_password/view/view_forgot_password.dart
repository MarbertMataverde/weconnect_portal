import 'package:flutter/material.dart';
import 'package:weconnect_portal/features/forgot_password/view/view.dart';
import 'package:weconnect_portal/responsive.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      phone: ForgotPasswordPhone(),
      tablet: ForgotPasswordTablet(),
      desktop: ForgotPasswordDesktop(),
    );
  }
}
