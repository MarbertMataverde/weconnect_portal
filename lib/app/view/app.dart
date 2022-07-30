import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:weconnect_portal/firebase_options.dart';

void main() async {
  /// Firebase Initialization
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const BaseCommit());
}

class BaseCommit extends StatelessWidget {
  const BaseCommit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Base Commit',
      home: Scaffold(
        body: Center(
          child: Text('Base Commit'),
        ),
      ),
    );
  }
}
