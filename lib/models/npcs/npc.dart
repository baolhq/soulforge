import 'package:soulforge/enums/npc_role.dart';
import 'package:soulforge/models/npcs/dialogue.dart';

class NPC {
  String name;
  String background;
  NpcRole role;
  late List<Dialogue> dialogues;

  NPC(
      {required this.name,
      required this.background,
      this.role = NpcRole.vendor}) {
    dialogues = List.empty(growable: true);
  }

  Dialogue getDialogue(int index) {
    if (index < dialogues.length) {
      return dialogues[index];
    }
    return Dialogue(
        text: "I don't have anything to say right now", options: ["Leave"]);
  }
}
