import 'package:soulforge/enums/npc_role.dart';
import 'package:uuid/uuid.dart';

class NPC {
  late String id;
  String name;
  String background;
  NpcRole role;

  NPC(
      {required this.name,
      required this.background,
      this.role = NpcRole.vendor}) {
    id = Uuid().v4();
  }
}
