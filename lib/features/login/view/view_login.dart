import 'package:flutter/material.dart';
import 'package:weconnect_portal/features/login/view/veiw.dart';
import 'package:weconnect_portal/responsive.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      phone: LoginPhone(),
      tablet: LoginTablet(),
      desktop: LoginDesktop(),
    );
  }
}
