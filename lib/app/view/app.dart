import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:weconnect_portal/feature/login/view/view_login.dart';
import 'package:weconnect_portal/firebase_options.dart';
import 'package:weconnect_portal/theme.dart';

void main() async {
  /// Firebase Initialization
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const App());
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
