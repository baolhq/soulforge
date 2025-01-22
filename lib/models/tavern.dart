// tavern.dart
//
// Focuses on recruiting party members and finding quests.

import 'package:soulforge/models/character.dart';
import 'package:soulforge/models/item.dart';
import 'package:soulforge/models/quest.dart';

class Tavern {
  final int? id;
  final String name;
  final String? description;
  late List<Character> recuits;
  late List<Quest> availableQuests;
  late List<Item> stocks;

  Tavern({required this.name, this.id, this.description}) {
    recuits = List.empty(growable: true);
    availableQuests = List.empty(growable: true);
    stocks = List.empty(growable: true);
  }
}
