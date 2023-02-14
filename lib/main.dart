import 'dart:io';

import 'package:big_picture/custom_theme.dart';
import 'package:big_picture/screens/home_screen.dart';
import 'package:big_picture/screens/login_screen.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: '.env');

  if (!kIsWeb) {
    if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
      await DesktopWindow.setMinWindowSize(const Size(400, 400));
    }
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomTheme().lightTheme,
      darkTheme: CustomTheme().darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      builder: (context, child) => ResponsiveWrapper.builder(
        child,
        minWidth: 480,
        maxWidth: MediaQuery.of(context).size.width,
        defaultScale: true,
        breakpoints: [
          const ResponsiveBreakpoint.autoScale(480, name: PHONE),
          const ResponsiveBreakpoint.autoScale(800, name: TABLET),
          const ResponsiveBreakpoint.autoScale(1000, name: DESKTOP),
        ],
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
