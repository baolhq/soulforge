import 'package:soulforge/enums/status.dart';
import 'package:soulforge/enums/weapon_type.dart';
import 'package:soulforge/models/item.dart';
import 'package:soulforge/models/magic.dart';
import 'package:soulforge/models/skill.dart';

class Weapon extends Item {
  double weight = 1;
  double damageMultiplier = 1;
  double attackRatingMultiplier = 1;
  int upgradeLevel = 0;
  WeaponType type = WeaponType.straighSword;
  List<Status> statuses = List.empty(growable: true);
  List<Skill> skills = List.empty(growable: true);
  List<Magic> magics = List.empty(growable: true);
}
