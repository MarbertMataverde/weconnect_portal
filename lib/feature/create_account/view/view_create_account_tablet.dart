import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:iconsax/iconsax.dart';
import 'package:weconnect_portal/feature/create_account/data/data_check_access_code.dart';
import 'package:weconnect_portal/feature/create_account/data/data_create_user.dart';
import 'package:weconnect_portal/feature/create_account/logic/logic_on_step_continue.dart';
import 'package:weconnect_portal/feature/create_account/widget/widget_controllerbuilder.dart';
import 'package:weconnect_portal/global/widget/widget_global_appbar.dart';
import 'package:weconnect_portal/global/widget/widget_global_dialog.dart';
import 'package:weconnect_portal/global/widget/widget_global_dropdownbuttonformfield.dart';
import 'package:weconnect_portal/global/widget/widget_global_sizedbox.dart';
import 'package:weconnect_portal/global/widget/widget_global_text.dart';
import 'package:weconnect_portal/global/widget/widget_global_textformfield.dart';

int _currentStep = 0;

late bool _isPasswordVisible;

bool? _isSubmitEnabled = false;

bool _isCheckingAccessCode = false;

bool _isCreatingAccount = false;

/// List of college dropdown menu items
List<String> _colleges = ['COA', 'COB', 'CCS'];

/// Current [_colleges] selected item
String? _collegeSelectedItem;

/// List of gender dropdown menu items
List<String> _genders = ['Male', 'Female', 'Others'];

/// Current [_gender] selected item
String? _genderSelectedItem;

DateTime? _birthDate;

/// List of account type
List<String> _accountTypes = ['Student', 'Professor'];

/// Current [_accountTypes] selected item is Student
String? _accountTypeSelectedItem;

class CreateAccountTablet extends StatefulWidget {
  const CreateAccountTablet({Key? key}) : super(key: key);

  @override
  State<CreateAccountTablet> createState() => _CreateAccountTabletState();
}

class _CreateAccountTabletState extends State<CreateAccountTablet> {
  final GlobalKey<FormState> _personalInformationValidationKey =
      GlobalKey<FormState>();

  final GlobalKey<FormState> _accountInformationValidationKey =
      GlobalKey<FormState>();

  final GlobalKey<FormState> _loginInformationValidationKey =
      GlobalKey<FormState>();

  final GlobalKey<FormState> _accessCodeValidationKey = GlobalKey<FormState>();

  // Personal Information
  late TextEditingController firstNameController;
  late TextEditingController middleNameController;
  late TextEditingController lastNameController;
  late TextEditingController addressController;
  late TextEditingController birthDateController;

  // Account Information
  late TextEditingController accountTypeController;
  // Student Type
  late TextEditingController studentNumberController;
  late TextEditingController collegeController;
  // Professor Type Controller
  late TextEditingController employeeNumberController;

  // Login Information
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  // Access Code Controller
  late TextEditingController accessCodeController;
  @override
  void initState() {
    super.initState();
    _isPasswordVisible = false;

    // Personal Information
    firstNameController = TextEditingController();
    middleNameController = TextEditingController();
    lastNameController = TextEditingController();
    addressController = TextEditingController();
    birthDateController = TextEditingController();

    // Account Information
    accountTypeController = TextEditingController();
    // Student Type Controller
    studentNumberController = TextEditingController();
    collegeController = TextEditingController();
    // Professor Type
    employeeNumberController = TextEditingController();

    // Login Information
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();

    // Access Code
    accessCodeController = TextEditingController();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    middleNameController.dispose();
    lastNameController.dispose();
    addressController.dispose();
    birthDateController.dispose();
    accountTypeController.dispose();
    studentNumberController.dispose();
    collegeController.dispose();
    employeeNumberController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    accessCodeController.dispose();
    super.dispose();
  }

  void Function() nextStep() {
    return () {
      if (_currentStep != 3) {
        setState(() => _currentStep++);
      }
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: globalAppBar(
        context: context,
        onPressed: () => Navigator.pop(context),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: globalText(
                text: 'Set up your WeConnect account',
                textScaleFactor: 1.2,
                fontWeight: FontWeight.w600,
              ),
            ),
            Stepper(
              physics: const ClampingScrollPhysics(),
              currentStep: _currentStep,
              onStepContinue: _currentStep == 0
                  //Personal Information
                  ? personalInformationStepContinue(
                      context: context,
                      birthDate: _birthDate,
                      currentStep: _currentStep,
                      genderSelectedItem: _genderSelectedItem,
                      personalInformationValidationKey:
                          _personalInformationValidationKey,
                      nextStep: nextStep(),
                    )
                  : _currentStep == 1
                      // Account Information Step
                      ? accountInformationStepContinue(
                          context: context,
                          accountTypeSelectedItem: _accountTypeSelectedItem,
                          accountInformationValidationKey:
                              _accountInformationValidationKey,
                          selectedCollege: _collegeSelectedItem,
                          nextStep: nextStep(),
                        )
                      : _currentStep == 2
                          ? loginInformationStepContinue(
                              context: context,
                              loginInformationValidationKey:
                                  _loginInformationValidationKey,
                              password: passwordController.text,
                              confirmPassword: confirmPasswordController.text,
                              nextStep: nextStep(),
                            )
                          : null,
              onStepCancel: () {
                if (_currentStep != 0) {
                  setState(() => _currentStep--);
                }
              },
              onStepTapped: null,
              controlsBuilder: (context, details) {
                return _isCreatingAccount
                    ? SpinKitCircle(
                        color: Theme.of(context).primaryColor,
                        size: 34,
                      )
                    : buildControlsBuilder(
                        context: context,
                        details: details,
                        onSubmit: () async {
                          FocusScope.of(context).unfocus();
                          setState(() {
                            _isCreatingAccount = true;
                          });
                          await createAccountWithEmailAndPassword(
                            context: context,
                            firstName: firstNameController.text,
                            middleName: middleNameController.text,
                            lastName: lastNameController.text,
                            address: addressController.text,
                            gender: _genderSelectedItem as String,
                            birthDate:
                                Timestamp.fromDate(_birthDate as DateTime),
                            accountType:
                                _accountTypeSelectedItem!.toLowerCase(),
                            college: _collegeSelectedItem,
                            studentNumber: studentNumberController.text,
                            employeeNumber: employeeNumberController.text,
                            email: emailController.text,
                            password: passwordController.text,
                            accessCode: accessCodeController.text,
                          );
                          setState(() {
                            _isCreatingAccount = false;
                          });
                        },
                        enableSubmitButton: _isSubmitEnabled,
                      );
              },
              steps: <Step>[
                Step(
                  isActive: _currentStep >= 0,
                  title: globalText(text: 'Personal Information'),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Form(
                        key: _personalInformationValidationKey,
                        child: Column(
                          children: [
                            globalTextFormField(
                              controller: firstNameController,
                              context: context,
                              hint: 'First Name',
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Required';
                                }
                                return null;
                              },
                            ),
                            sizedBox(),
                            globalTextFormField(
                              controller: middleNameController,
                              context: context,
                              hint: 'Middle Name',
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Required';
                                }
                                return null;
                              },
                            ),
                            sizedBox(),
                            globalTextFormField(
                              controller: lastNameController,
                              context: context,
                              hint: 'Last Name',
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Required';
                                }
                                return null;
                              },
                            ),
                            sizedBox(),
                            globalTextFormField(
                              controller: addressController,
                              context: context,
                              hint: 'Adress',
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Required';
                                }
                                return null;
                              },
                            ),
                            sizedBox(),
                            globalDropdownButtonFormField(
                              context: context,
                              hintText: 'Gender',
                              value: _genderSelectedItem,
                              items: _genders
                                  .map(
                                    (gender) => DropdownMenuItem(
                                      value: gender,
                                      child: globalText(text: gender),
                                    ),
                                  )
                                  .toList(),
                              onChange: (gender) => setState(
                                () => _genderSelectedItem = gender,
                              ),
                            ),
                          ],
                        ),
                      ),
                      sizedBox(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: const Color(0xff323645),
                                borderRadius: BorderRadius.circular(2),
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    _birthDate == null
                                        ? 'Select Birth Date'
                                        : 'Birthdate:  ${_birthDate!.month}-${_birthDate!.day}-${_birthDate!.year}',
                                  ),
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            splashRadius: 24,
                            icon: const Icon(Iconsax.calendar_1),
                            onPressed: () async {
                              DateTime? newBirthDate = await showDatePicker(
                                helpText: 'Birthdate',
                                context: context,
                                initialDate: DateTime(2000, 01, 01),
                                firstDate: DateTime(1940),
                                lastDate: DateTime(2040),
                              );

                              if (newBirthDate == null) return;
                              setState(() => _birthDate = newBirthDate);
                            },
                          ),
                        ],
                      ),
                      sizedBox(),
                    ],
                  ),
                ),
                Step(
                  isActive: _currentStep >= 1,
                  title: globalText(text: 'Account Information'),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      globalDropdownButtonFormField(
                        context: context,
                        value: _accountTypeSelectedItem,
                        hintText: 'Select Account Type',
                        items: _accountTypes
                            .map(
                              (accountType) => DropdownMenuItem(
                                value: accountType,
                                child: globalText(text: accountType),
                              ),
                            )
                            .toList(),
                        onChange: (accountType) => setState(
                          () => _accountTypeSelectedItem = accountType,
                        ),
                      ),
                      sizedBox(),
                      _accountTypeSelectedItem != null
                          ? Form(
                              key: _accountInformationValidationKey,
                              child: Visibility(
                                visible: _accountTypeSelectedItem == 'Student',
                                replacement: Column(
                                  children: [
                                    globalTextFormField(
                                      controller: employeeNumberController,
                                      context: context,
                                      hint: 'Employee Number',
                                      inputFormater: <TextInputFormatter>[
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'[0-9]')),
                                      ],
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Required';
                                        }
                                        return null;
                                      },
                                    ),
                                    sizedBox(),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    globalTextFormField(
                                      controller: studentNumberController,
                                      context: context,
                                      hint: 'Student Number',
                                      inputFormater: <TextInputFormatter>[
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'[0-9]')),
                                      ],
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Required';
                                        }
                                        return null;
                                      },
                                    ),
                                    sizedBox(),
                                    globalDropdownButtonFormField(
                                      context: context,
                                      hintText: 'College',
                                      value: _collegeSelectedItem,
                                      items: _colleges
                                          .map(
                                            (college) => DropdownMenuItem(
                                              value: college,
                                              child: globalText(text: college),
                                            ),
                                          )
                                          .toList(),
                                      onChange: (college) => setState(
                                          () => _collegeSelectedItem = college),
                                    ),
                                    sizedBox(),
                                  ],
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
                Step(
                  isActive: _currentStep >= 2,
                  title: globalText(text: 'Login Information'),
                  content: Form(
                    key: _loginInformationValidationKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        globalTextFormField(
                          controller: emailController,
                          context: context,
                          hint: 'Email Address',
                          textInputType: TextInputType.emailAddress,
                          validator: (value) {
                            bool isEmailValid = RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value!);
                            if (!isEmailValid) {
                              return 'Invalid email';
                            }
                            if (value.isEmpty) {
                              return 'Please enter email';
                            }
                            return null;
                          },
                        ),
                        sizedBox(),
                        globalTextFormField(
                          controller: passwordController,
                          context: context,
                          hint: 'Password',
                          textInputType: TextInputType.visiblePassword,
                          textScaleFactor: 1.2,
                          isObscure: !_isPasswordVisible,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Required';
                            }
                            return null;
                          },
                          passwordVisibilityIconButton: IconButton(
                            splashRadius: 0.1,
                            color:
                                Theme.of(context).textTheme.bodyMedium!.color,
                            onPressed: () => setState(
                              () => _isPasswordVisible = !_isPasswordVisible,
                            ),
                            icon: Icon(
                              _isPasswordVisible
                                  ? Iconsax.eye
                                  : Iconsax.eye_slash,
                            ),
                          ),
                        ),
                        sizedBox(),
                        globalTextFormField(
                          controller: confirmPasswordController,
                          context: context,
                          hint: 'Confirm Password',
                          textInputType: TextInputType.visiblePassword,
                          textScaleFactor: 1.2,
                          isObscure: !_isPasswordVisible,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Required';
                            }
                            return null;
                          },
                          passwordVisibilityIconButton: IconButton(
                            splashRadius: 0.1,
                            color:
                                Theme.of(context).textTheme.bodyMedium!.color,
                            onPressed: () => setState(
                              () => _isPasswordVisible = !_isPasswordVisible,
                            ),
                            icon: Icon(
                              _isPasswordVisible
                                  ? Iconsax.eye
                                  : Iconsax.eye_slash,
                            ),
                          ),
                        ),
                        sizedBox(),
                      ],
                    ),
                  ),
                ),
                Step(
                  isActive: _currentStep >= 3,
                  title: globalText(text: 'Access Code Checker'),
                  subtitle: globalText(
                      text:
                          'To complete account creation we need to check if your access code is valid'),
                  content: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Form(
                              key: _accessCodeValidationKey,
                              child: globalTextFormField(
                                controller: accessCodeController,
                                context: context,
                                hint: 'Access Code',
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Required';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                          _isCheckingAccessCode
                              ? SpinKitCircle(
                                  color: Theme.of(context).primaryColor,
                                  size: 34,
                                )
                              : IconButton(
                                  tooltip: 'Check now',
                                  splashRadius: 24,
                                  icon: const Icon(Iconsax.search_status),
                                  onPressed: () async {
                                    FocusScope.of(context).unfocus();
                                    if (_accessCodeValidationKey.currentState!
                                            .validate() ==
                                        true) {
                                      _isSubmitEnabled = false;
                                      setState(
                                          () => _isCheckingAccessCode = true);
                                      if (await checkAccessCode(
                                          accessCodeController.text.trim(),
                                          context)) {
                                        _isSubmitEnabled = true;
                                      } else {
                                        globalDialog(
                                            context: context,
                                            content:
                                                '${accessCodeController.text} is not existing. \n please make sure you enter a correct and valid access code.');
                                      }
                                      setState(
                                          () => _isCheckingAccessCode = false);
                                    }
                                  },
                                ),
                        ],
                      ),
                      sizedBox(),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
