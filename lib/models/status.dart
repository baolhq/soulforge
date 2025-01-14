import 'package:soulforge/enums/status_type.dart';
import 'package:soulforge/models/character.dart';
import 'package:soulforge/models/stat_modifier.dart';
import 'package:uuid/uuid.dart';

class Status {
  late String id;
  final String name;
  final String description;
  final StatusType type;
  final List<StatModifier> modifiers;
  int duration;
  double spreadChance;

  Status(
      {required this.name,
      required this.description,
      this.type = StatusType.debuff,
      required this.modifiers,
      this.duration = 0,
      this.spreadChance = 0}) {
    id = Uuid().v4();
  }

  void activate(Character target) {}
  void deactivate(Character target) {}
  void update(Character target) {}

  @override
  String toString() {
    return '$name (Duration: $duration turns, Spread Chance: ${spreadChance * 100}%)';
  }
}
