import 'package:soulforge/models/entity.dart';

class Enemy extends Entity {
  int experience;
  int gold;
  String treasureClassId;

  Enemy(
      {required super.name,
      this.experience = 1,
      this.gold = 1,
      this.treasureClassId = ""});
}
