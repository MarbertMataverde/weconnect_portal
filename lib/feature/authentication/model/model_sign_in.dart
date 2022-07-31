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
        title: 'User not found',
        content: e.message.toString(),
      );
    } else if (e.code == 'wrong-password') {
      globalDialog(
        context: context,
        title: 'Wrong password',
        content: e.message.toString(),
      );
    } else {
      globalDialog(context: context, content: 'Please restart the app');
    }
  }
}
