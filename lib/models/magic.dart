import 'package:soulforge/enums/magic_type.dart';
import 'package:soulforge/models/statuses/status.dart';
import 'package:uuid/uuid.dart';

class Magic {
  late String id;
  final String name;
  final String description;
  int manaCost;
  int duration;
  double accuracy;
  double recharge;
  bool isRecharging;
  bool isChargeable;
  bool isMultiTarget;
  bool isPiercing;
  MagicType magicType;
  List<Status> statuses;
  List<Magic> prerequisites;

  Magic({
    required this.name,
    required this.description,
    required this.statuses,
    required this.prerequisites,
    this.manaCost = 0,
    this.duration = 0,
    this.accuracy = 100,
    this.recharge = 0,
    this.isRecharging = false,
    this.isChargeable = false,
    this.isMultiTarget = false,
    this.isPiercing = false,
    this.magicType = MagicType.sorcery,
  }) {
    id = Uuid().v4();
  }
}
