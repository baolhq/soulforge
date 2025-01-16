import 'package:soulforge/models/character.dart';
import 'package:uuid/uuid.dart';

/// Singleton class to manage the player's party.
class Party {
  static final Party _instance = Party._internal();

  late String id;
  late List<List<Character>> members;

  Party._internal() {
    id = Uuid().v4();
    members = List.empty(growable: true);
  }

  // Factory constructor to return the same instance
  factory Party() {
    return _instance;
  }
}
