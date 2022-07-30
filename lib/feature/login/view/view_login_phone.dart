import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:weconnect_portal/feature/login/widget/widget_login_textbutton.dart';
import 'package:weconnect_portal/feature/login/widget/widget_login_textformfield.dart';
import 'package:weconnect_portal/feature/login/widget/widget_svg.dart';
import 'package:weconnect_portal/global/widget/widget_global_sizedbox.dart';
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
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.020),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                svgAssetLogo(
                  assetPath: 'assets/app_icon/plain_light_logo.svg',
                  width: MediaQuery.of(context).size.width * 0.1,
                ),
                sizedBox(),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      globalText(
                        text: 'Login your account.',
                        textScaleFactor: 1.5,
                        fontWeight: FontWeight.w600,
                      ),
                      globalText(
                        text: '"Nurturing Tommorow\'s Noblest"',
                        fontWeight: FontWeight.w100,
                      ),
                      sizedBox(),
                      loginTextFormField(
                        context: context,
                        label: 'Email',
                        textInputType: TextInputType.emailAddress,
                        prefixIcon: Icon(
                          Iconsax.sms,
                          color: Theme.of(context).textTheme.bodyMedium!.color,
                        ),
                      ),
                      sizedBox(),
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
                      sizedBox(),
                      globalTextButton(
                        context: context,
                        text: 'Login',
                      ),
                    ],
                  ),
                ),
                sizedBox(),
                loginCreate(context: context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
