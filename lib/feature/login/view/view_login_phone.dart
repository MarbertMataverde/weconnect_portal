import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:weconnect_portal/feature/login/widget/widget_login_textbutton.dart';
import 'package:weconnect_portal/feature/login/widget/widget_login_textformfield.dart';
import 'package:weconnect_portal/feature/login/widget/widget_svg.dart';
import 'package:weconnect_portal/global/widget/widget_global_text.dart';
import 'package:weconnect_portal/global/widget/widget_global_textbutton.dart';

late bool _passwordVisible;

class LoginPhone extends StatefulWidget {
  const LoginPhone({Key? key}) : super(key: key);

  @override
  State<LoginPhone> createState() => _LoginPhoneState();
}

class _LoginPhoneState extends State<LoginPhone> {
  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.1),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                svgAssetLogo(
                  assetPath: 'assets/app_icon/plain_light_logo.svg',
                  width: MediaQuery.of(context).size.width * 0.2,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      globalText(
                        text: 'Login your account.',
                        textScaleFactor: 2,
                        fontWeight: FontWeight.w600,
                      ),
                      globalText(
                        text: '"Nurturing Tommorow\'s Noblest"',
                        fontWeight: FontWeight.w100,
                      ),
                      loginTextFormField(
                        context: context,
                        label: 'Email',
                        textInputType: TextInputType.emailAddress,
                        prefixIcon: Icon(
                          Iconsax.sms,
                          color: Theme.of(context).textTheme.bodyMedium!.color,
                        ),
                      ),
                      loginTextFormField(
                        context: context,
                        label: 'Password',
                        textInputType: TextInputType.visiblePassword,
                        isObscure: !_passwordVisible,
                        prefixIcon: Icon(
                          Iconsax.password_check,
                          color: Theme.of(context).textTheme.bodyMedium!.color,
                        ),
                        passwordVisibilityIconButton: IconButton(
                          splashRadius: 0.1,
                          color: Theme.of(context).textTheme.bodyMedium!.color,
                          onPressed: () => setState(
                            () => _passwordVisible = !_passwordVisible,
                          ),
                          icon: Icon(
                            _passwordVisible ? Iconsax.eye : Iconsax.eye_slash,
                          ),
                        ),
                      ),
                      loginForgotPassword(context: context),
                      globalTextButton(
                        context: context,
                        text: 'Login',
                      ),
                    ],
                  ),
                ),
                loginCreate(context: context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}