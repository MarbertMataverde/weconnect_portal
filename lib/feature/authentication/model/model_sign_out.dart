import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:weconnect_portal/global/widget/widget_global_dialog.dart';

final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

Future<void> signOut({required BuildContext context}) async {
  try {
    await _firebaseAuth.signOut();
  } on FirebaseAuthException catch (e) {
    globalDialog(context: context, content: e.toString());
  }
}
