import 'package:drift/drift.dart';
import 'package:soulforge/helpers/database.dart';

part 'event_logs.g.dart';

class EventLogs extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get type => text()();
  TextColumn get details => text().nullable()();
  DateTimeColumn get timestamp =>
      dateTime().withDefault(Constant(DateTime.now()))();
}

// Mixin for race-related queries
@DriftAccessor(tables: [EventLogs])
class EventLogDao extends DatabaseAccessor<Database> with _$EventLogDaoMixin {
  EventLogDao(super.db);
}
