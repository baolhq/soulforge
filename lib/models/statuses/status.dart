import 'package:soulforge/models/character.dart';

class Status {
  final int? id;
  final String name;
  final String? description;
  final int statusTypeId;
  final int? savingThrowId;
  int? duration;

  Status(
      {required this.name,
      required this.statusTypeId,
      this.id,
      this.description,
      this.savingThrowId,
      this.duration});

  void activate(Character target) {}
  void deactivate(Character target) {}
  void update(Character target) {}
}
