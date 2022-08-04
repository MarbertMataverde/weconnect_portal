import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:weconnect_portal/global/widget/widget_global_dialog.dart';

final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

Future<void> createAccountWithEmailAndPassword({
  required BuildContext context,
  // Personal Information
  required String firstName,
  required String middleName,
  required String lastName,
  required String address,
  required String gender,
  required Timestamp birthDate,
  // Account Information
  required String accountType,
  // if student
  String? studentNumber,
  String? college,
  // if professor
  String? employeeNumber,
  // Login Information
  required String email,
  required String password,
  // Access Code
  required String accessCode,
}) async {
  try {
    await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then(
      (value) async {
        _firebaseFirestore
            .collection('accounts')
            .doc(accountType)
            .collection('account')
            .doc(_firebaseAuth.currentUser!.uid)
            .set(
              accountType == 'student'
                  ? {
                      // Personal Information
                      'first-name': firstName,
                      'middle-name': middleName,
                      'last-name': lastName,
                      'address': address,
                      'gender': gender,
                      'birth-date': birthDate,
                      // Account Information
                      'account-type': accountType,

                      /// This is a [STUDENT] account type so we will use
                      /// [studentNumber] and [college] constructor.
                      'student-number': studentNumber,
                      'college': college,
                      // Login Information
                      'email': email,
                      // Access Code
                      'access-code': accessCode,
                    }
                  : {
                      // Personal Information
                      'first-name': firstName,
                      'middle-name': middleName,
                      'last-name': lastName,
                      'address': address,
                      'gender': gender,
                      'birth-date': birthDate,
                      // Account Information
                      'account-type': accountType,

                      /// This is a [PROFESSOR] account type so we will use
                      /// [employeeNumber] constructor.
                      'employee-number': employeeNumber,
                      // Login Information
                      'email': email,
                      // Access Code
                      'access-code': accessCode,
                    },
            );
      },
    ).whenComplete(
      () async => await _firebaseFirestore
          .collection(accessCode)
          .doc(accessCode)
          .delete()
          .whenComplete(
            () => Navigator.of(context).pop(),
          ),
    );
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      globalDialog(
        context: context,
        content: e.message.toString(),
      );
    } else if (e.code == 'email-already-in-use') {
      globalDialog(
        context: context,
        content: e.message.toString(),
      );
    }
  } catch (e) {
    globalDialog(context: context, content: e.toString());
  }
}
