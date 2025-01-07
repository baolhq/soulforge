import 'package:soulforge/enums/status.dart';
import 'package:soulforge/enums/weapon_type.dart';
import 'package:soulforge/models/item.dart';
import 'package:soulforge/models/magic.dart';
import 'package:soulforge/models/skill.dart';

class Weapon extends Item {
  double weight = 1;
  double damageMultiplier = 1;
  double attackRatingMultiplier = 1;
  WeaponType type = WeaponType.straighSword;
  List<Status> statuses = List.empty();
  List<Skill> skills = List.empty();
  List<Magic> magics = List.empty();
}
