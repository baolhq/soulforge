import 'package:soulforge/enums/magic_type.dart';
import 'package:soulforge/enums/status.dart';
import 'package:uuid/uuid.dart';

class Magic {
  late String id;
  String name = "";
  String description = "";
  int energyCost = 0;
  double recharge = 0;
  bool isRecharging = false;
  bool isChargeable = false;
  bool isMultiTarget = false;
  bool isPiercing = false;
  MagicType type = MagicType.sorcery;
  List<Status> statuses = List.empty();

  Magic() {
    id = Uuid().v4();
  }
}
