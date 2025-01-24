// database.dart
//
// Database helpers and functionalities for persistance storage.

import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:soulforge/models/area.dart';

part 'database.g.dart';

@DriftDatabase(tables: [Areas])
class Database extends _$Database {
  Database() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static LazyDatabase _openConnection() {
    return LazyDatabase(() async {
      // Get the application documents directory
      final dbFolder = await getApplicationDocumentsDirectory();
      // Construct the path to the database file
      final file = File(path.join(dbFolder.path, 'soulforge.db'));
      // Return the database connection
      return NativeDatabase(file);
    });
  }
}
