import 'package:soulforge/models/entity.dart';

class Enemy extends Entity {
  final String description;
  int experience;
  int gold;
  String treasureClassId;

  Enemy(
      {required super.name,
      required this.description,
      this.experience = 1,
      this.gold = 1,
      this.treasureClassId = ""});
}
