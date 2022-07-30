import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:weconnect_portal/feature/login/view/view_login.dart';
import 'package:weconnect_portal/firebase_options.dart';
import 'package:device_preview/device_preview.dart';
import 'package:weconnect_portal/theme.dart';

void main() async {
  /// Firebase Initialization
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const App(), // Wrap your app
    ),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightThemeData,
      themeMode: ThemeMode.dark,
      darkTheme: darkThemeData,
      home: const Login(),
    );
  }
}
