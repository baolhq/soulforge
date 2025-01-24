import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:soulforge/helpers/database.dart';
import 'package:soulforge/screens/creation.dart';

void main() async {
  // runApp(const MainApp());
  WidgetsFlutterBinding.ensureInitialized();

  final database = Database();

  await database.into(database.areas).insert(AreasCompanion.insert(
        name: "Somewhere",
      ));
  List<Area> allItems = await database.select(database.areas).get();

  debugPrint('items in database: $allItems');
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CreationScreen(),
      ),
      theme: ThemeData(textTheme: GoogleFonts.bitterTextTheme()),
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
    );
  }
}
