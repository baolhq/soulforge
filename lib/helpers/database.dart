// database.dart
//
// Database helpers and functionalities for persistance storage.

import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:soulforge/models/areas/area.dart';
import 'package:soulforge/models/entities/races.dart';
import 'package:soulforge/models/telemetries/event_logs.dart';

part 'database.g.dart';

@DriftDatabase(tables: [Areas, Races, EventLogs])
class Database extends _$Database {
  Database([QueryExecutor? e])
      : super(e ??
            driftDatabase(
                name: "soulforge",
                native: const DriftNativeOptions(
                  databaseDirectory: getApplicationSupportDirectory,
                ),
                web: DriftWebOptions(
                    sqlite3Wasm: Uri.parse("sqlite3.wasm"),
                    driftWorker: Uri.parse("drift_worker.js"),
                    onResult: (result) {
                      if (result.missingFeatures.isNotEmpty) {
                        debugPrint(
                          'Using ${result.chosenImplementation} due to unsupported '
                          'browser features: ${result.missingFeatures}',
                        );
                      }
                    })));

  @override
  int get schemaVersion => 1;

  Future<void> seedRaces() async {
    final raceDao = RaceDao(this);

    final races = await raceDao.select(raceDao.races).get();
    if (races.isNotEmpty) return;

    await batch((batch) {
      batch.insertAll(
        raceDao.races,
        [
          RacesCompanion.insert(
            name: 'Human',
            perk: Value('+1 Starting attribute point'),
            description: Value(
                'A versatile and adaptable race, known for their balance in all attributes.'),
          ),
          RacesCompanion.insert(
            name: 'High Elf',
            perk: Value('+1 Intelligence'),
            description: Value(
                'Graceful and intelligent beings, skilled in magic and archery.'),
          ),
          RacesCompanion.insert(
            name: 'Wood Elf',
            perk: Value('+1 Wisdom'),
            description: Value(
                'A magical and nature-bound race, known for their mastery of arcane arts and harmony with the forest.'),
          ),
          RacesCompanion.insert(
            name: 'Dark Elf',
            perk: Value('+1 Dexterity'),
            description: Value(
                'They are respected as skilled combatants, known for their stealth, agility, and mastery of dark magic and weapons.'),
          ),
          RacesCompanion.insert(
            name: 'Dwarf',
            perk: Value('+1 Constitution'),
            description: Value(
                'Sturdy and strong, with a deep connection to the earth and mastery in crafting.'),
          ),
          RacesCompanion.insert(
            name: 'Orc',
            perk: Value('+1 Strength'),
            description: Value(
                'A warrior race, fierce and strong, with a deep bond to nature and battle.'),
          ),
          RacesCompanion.insert(
            name: 'Halfling',
            perk: Value('+1 Luck'),
            description: Value(
                'Small and nimble, known for their stealth and agility, often skilled in thievery.'),
          ),
          RacesCompanion.insert(
            name: 'Tiefling',
            perk: Value('+1 Charisma'),
            description: Value(
                'A race with infernal heritage, often shunned, but gifted with dark powers and an affinity for magic.'),
          ),
          RacesCompanion.insert(
            name: 'Vampire',
            perk: Value('+1 Charisma'),
            description: Value(
                'Undead beings that thrive on blood, known for their immortality, charm, and formidable combat skills.'),
          ),
        ],
      );
    });
  }
}
