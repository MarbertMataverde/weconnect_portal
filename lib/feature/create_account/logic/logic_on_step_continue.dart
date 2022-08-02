import 'package:flutter/material.dart';
import 'package:weconnect_portal/global/widget/widget_global_dialog.dart';

void Function()? personalInformationStepContinue({
  required BuildContext context,
  required int currentStep,
  required GlobalKey<FormState> personalInformationValidationKey,
  required String? genderSelectedItem,
  required DateTime? birthDate,
  required void Function() nextStep,
}) {
  return () {
    FocusScope.of(context).unfocus();
    if (personalInformationValidationKey.currentState!.validate() == true) {
      if (genderSelectedItem == null && birthDate == null) {
        globalDialog(
          context: context,
          title: 'Empty Field',
          content: 'Gender & Birthdate can\'t be empty.',
        );
      } else if (genderSelectedItem == null) {
        globalDialog(
          context: context,
          title: 'Gender Missing',
          content: 'Gender can\'t be empty.',
        );
      } else if (birthDate == null) {
        globalDialog(
          context: context,
          title: 'Birthdate Missing',
          content: 'Birthdate can\'t be empty.',
        );
      } else {
        nextStep();
      }
    }
  };
}

void Function()? accountInformationStepContinue({
  required BuildContext context,
  required String? accountTypeSelectedItem,
  required GlobalKey<FormState> accountInformationValidationKey,
  required String? selectedCollege,
  required void Function() nextStep,
}) {
  return () {
    FocusScope.of(context).unfocus();
    if (accountTypeSelectedItem != null &&
        accountTypeSelectedItem == 'Student') {
      if (accountInformationValidationKey.currentState!.validate() == true) {
        if (selectedCollege == null) {
          globalDialog(
            context: context,
            title: 'College',
            content: 'College can\'t be empty',
          );
        } else {
          nextStep();
        }
      }
    } else if (accountTypeSelectedItem == 'Professor') {
      if (accountInformationValidationKey.currentState!.validate() == true) {
        nextStep();
      }
    } else if (accountTypeSelectedItem == null) {
      globalDialog(
        context: context,
        title: 'Account Type',
        content: 'Please select account type for this account.',
      );
    } else {
      nextStep();
    }
  };
}
