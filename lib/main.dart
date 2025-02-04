import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:soulforge/screens/creation.dart';
import 'package:soulforge/screens/distribution.dart';
import 'package:soulforge/screens/welcome.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const CreationScreen(),
      theme: ThemeData(fontFamily: "Bitter"),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("en", "US"),
        Locale("vi", "VN"),
      ],
      routes: {
        "/welcome": (context) => const WelcomeScreen(),
        "/creation": (context) => const CreationScreen(),
        "/distribution": (context) => const DistributionScreen(),
      },
    );
  }
}
