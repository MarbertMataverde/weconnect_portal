import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weconnect_portal/global/widget/widget_global_dialog.dart';

final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

Future<void> signInWithEmailAndPassword({
  required BuildContext context,
  required String email,
  required String password,
}) async {
  try {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      globalDialog(
        context: context,
        title: 'Oops',
        content: 'We couldn\'t find the email and password you entered.',
      );
    } else if (e.code == 'wrong-password') {
      globalDialog(
        context: context,
        title: 'Oops',
        content: 'Wrong password, make sure you entered a correct password.',
      );
    }
  } catch (e) {
    globalDialog(
      context: context,
      content: e.toString(),
    );
  }
}
