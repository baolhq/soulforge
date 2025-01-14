import 'package:soulforge/enums/magic_type.dart';
import 'package:soulforge/models/status.dart';
import 'package:uuid/uuid.dart';

class Magic {
  late String id;
  final String name;
  final String description;
  int energyCost;
  double recharge;
  bool isRecharging;
  bool isChargeable;
  bool isMultiTarget;
  bool isPiercing;
  MagicType type;
  List<Status> statuses;
  List<Magic> prerequisites;

  Magic({
    required this.name,
    required this.description,
    required this.statuses,
    required this.prerequisites,
    this.energyCost = 0,
    this.recharge = 0,
    this.isRecharging = false,
    this.isChargeable = false,
    this.isMultiTarget = false,
    this.isPiercing = false,
    this.type = MagicType.sorcery,
  }) {
    id = Uuid().v4();
  }
}
