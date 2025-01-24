import 'package:drift/drift.dart';

class PlayerActions extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get type => text()();
  TextColumn get details => text().nullable()();
  DateTimeColumn get timestamp =>
      dateTime().withDefault(Constant(DateTime.now()))();
}
