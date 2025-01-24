import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:soulforge/helpers/database.dart';
import 'package:soulforge/models/telemetries/event_logs.dart';
import 'package:soulforge/screens/creation.dart';
import 'package:soulforge/screens/distribution.dart';
import 'package:soulforge/screens/welcome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Check if this is the first app open
  final db = Database();
  final eventLogDao = EventLogDao(db);
  final isFirstOpen = await checkFirstTimeOpen(eventLogDao);

  runApp(const MainApp(
    isFirstOpen: isFirstOpen,
  ));
}

/// Checks if this is the first time the app is opened
Future<bool> checkFirstTimeOpen(EventLogDao eventLogDao) async {
  final logs = await eventLogDao.select(eventLogDao.eventLogs).get();

  if (logs.isEmpty) {
    // Log the first-time open event
    await eventLogDao.into(eventLogDao.eventLogs).insert(
          EventLogsCompanion(
            type: const Value('last_opened'),
            details: const Value('App launched'),
            timestamp: Value(DateTime.now()),
          ),
        );
    return true;
  }

  return false;
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CreationScreen(),
      ),
      theme: ThemeData(fontFamily: "Bitter"),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("en", "US"),
        Locale("vi", "VN"),
      ],
      routes: {
        "/welcome": (context) => WelcomeScreen(),
        "/creation": (context) => CreationScreen(),
        "/distribution": (context) => DistributionScreen(),
      },
    );
  }
}
