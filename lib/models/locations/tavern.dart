// tavern.dart
//
// Focuses on recruiting party members and finding quests.

import 'package:soulforge/models/character.dart';
import 'package:soulforge/models/item.dart';
import 'package:soulforge/models/locations/location.dart';
import 'package:soulforge/models/quest.dart';

class Tavern extends Location {
  late List<Character> recuits;
  late List<Quest> availableQuests;
  late List<Item> stocks;

  Tavern({required super.name, required super.description}) {
    recuits = List.empty(growable: true);
    availableQuests = List.empty(growable: true);
    stocks = List.empty(growable: true);
  }
}
