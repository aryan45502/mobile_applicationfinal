// import 'package:flutter/material.dart';
// import 'landing_page.dart';
// import 'login_page.dart';
// import 'register_page.dart';
// import 'home_page.dart';

// void main() {
//   runApp(WedPlanApp());
// }

// class WedPlanApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       initialRoute: '/',
//       routes: {
//         '/': (context) => LandingPage(),
//         '/login': (context) => LoginPage(),
//         '/register': (context) => RegisterPage(),
//         '/home': (context) => HomePage(),
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:wedplan/app_theme/theme.dart';

import 'home_page.dart';
import 'landing_page.dart';
import 'login_page.dart';
import 'register_page.dart';

void main() {
  runApp(const WedPlanApp());
}

class WedPlanApp extends StatelessWidget {
  const WedPlanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme, // Apply your custom theme from theme.dart
      themeMode: ThemeMode.light, // Ensure the light theme is used
      initialRoute: '/',
      routes: {
        '/': (context) => const LandingPage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
