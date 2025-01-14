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

  Status(
      {required this.name,
      required this.description,
      required this.modifiers,
      this.type = StatusType.debuff,
      this.duration = 0}) {
    id = Uuid().v4();
  }

  void activate(Character target) {}
  void deactivate(Character target) {}
  void update(Character target) {}
}
