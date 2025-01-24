import 'package:drift/drift.dart';
import 'package:soulforge/helpers/database.dart';

part 'races.g.dart';

class Races extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get perk => text().nullable()();
  TextColumn get description => text().nullable()();
}

// Mixin for race-related queries
@DriftAccessor(tables: [Races])
class RaceDao extends DatabaseAccessor<Database> with _$RaceDaoMixin {
  RaceDao(super.db);

  // Fetch all races
  Future<List<Race>> getAllRaces() => select(races).get();
}
