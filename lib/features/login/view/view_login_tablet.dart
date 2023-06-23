import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:weconnect_portal/features/authentication/model/model_sign_in.dart';
import 'package:weconnect_portal/features/login/widget/widget_login_textbutton.dart';
import 'package:weconnect_portal/features/login/widget/widget_login_textformfield.dart';
import 'package:weconnect_portal/features/login/widget/widget_svg.dart';
import 'package:weconnect_portal/global/widget/widget_global_sizedbox.dart';
import 'package:weconnect_portal/global/widget/widget_global_text.dart';
import 'package:weconnect_portal/global/widget/widget_global_textbutton.dart';

late bool _passwordVisible;

class LoginTablet extends StatefulWidget {
  const LoginTablet({Key? key}) : super(key: key);

  @override
  State<LoginTablet> createState() => _LoginTabletState();
}

class _LoginTabletState extends State<LoginTablet> {
  final _validationKey = GlobalKey<FormState>();

  late TextEditingController emailTextController;
  late TextEditingController passwordTextController;

  @override
  void initState() {
    super.initState();
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
    _passwordVisible = false;
  }

  @override
  void dispose() {
    emailTextController.dispose();
    passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
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
                width: MediaQuery.of(context).size.width * 0.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    globalText(
                      text: 'Login your account.',
                      textScaleFactor: 2.2,
                      fontWeight: FontWeight.w600,
                    ),
                    globalText(
                      text: '"Nurturing Tommorow\'s Noblest"',
                      fontWeight: FontWeight.w100,
                    ),
                    sizedBox(),
                    sizedBox(),
                    Form(
                      key: _validationKey,
                      child: Column(
                        children: [
                          loginTextFormField(
                            controller: emailTextController,
                            context: context,
                            label: 'Email',
                            textInputType: TextInputType.emailAddress,
                            prefixIcon: Icon(
                              Iconsax.sms,
                              color:
                                  Theme.of(context).textTheme.bodyMedium!.color,
                            ),
                            validator: (value) {
                              bool isEmailValid = RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value!);
                              if (value.isEmpty) {
                                return 'Please enter email';
                              }
                              if (!isEmailValid) {
                                return 'Invalid email';
                              }
                              return null;
                            },
                          ),
                          loginTextFormField(
                            controller: passwordTextController,
                            context: context,
                            label: 'Password',
                            textInputType: TextInputType.visiblePassword,
                            isObscure: !_passwordVisible,
                            prefixIcon: Icon(
                              Iconsax.password_check,
                              color:
                                  Theme.of(context).textTheme.bodyMedium!.color,
                            ),
                            passwordVisibilityIconButton: IconButton(
                              splashRadius: 0.1,
                              color:
                                  Theme.of(context).textTheme.bodyMedium!.color,
                              onPressed: () => setState(
                                () => _passwordVisible = !_passwordVisible,
                              ),
                              icon: Icon(
                                _passwordVisible
                                    ? Iconsax.eye
                                    : Iconsax.eye_slash,
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter password';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    loginForgotPassword(context: context),
                    sizedBox(),
                    globalTextButton(
                      context: context,
                      text: 'Login',
                      textScaleFactor: 1.2,
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        if (_validationKey.currentState!.validate() == true) {
                          signInWithEmailAndPassword(
                            context: context,
                            email: emailTextController.text.trim(),
                            password: passwordTextController.text.trim(),
                          );
                        }
                      },
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
    );
  }
}
