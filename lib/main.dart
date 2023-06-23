/// File: main.dart
///
/// Description: This file serves as the entry point of the application.
/// It initializes Firebase, sets up the application's theme, and defines the root widget.
///

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:weconnect_portal/features/login/view/view_login.dart';
import 'package:weconnect_portal/firebase_options.dart';
import 'package:weconnect_portal/theme.dart';

/// The main function that initializes the Flutter application.
/// It ensures Firebase is initialized and then runs the app.
Future<void> main() async {
  /// Firebase Initialization
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const App());
}

/// The root widget of the application.
/// It sets up the MaterialApp and defines the theme and initial route.
class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      /// Set the light theme as the default theme for the application.
      theme: lightThemeData,

      /// Set the dark theme as the default dark theme for the application.
      themeMode: ThemeMode.dark,
      darkTheme: darkThemeData,

      /// Determine the initial screen based on the user's authentication state.
      /// If the user is authenticated, show the home screen.
      /// If the user is not authenticated, show the login screen.
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(); // Show a loading indicator.
          } else if (snapshot.hasError) {
            return Container(); // Show a message to restart the app.
          } else if (snapshot.hasData) {
            return Container(); // Show the home screen.
          } else {
            return const Login(); // Show the login screen.
          }
        },
      ),
    );
  }
}
