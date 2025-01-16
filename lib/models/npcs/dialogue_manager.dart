import 'package:flutter/material.dart';
import 'package:soulforge/models/npcs/dialogue.dart';
import 'package:soulforge/models/npcs/npc.dart';

class DialogueManager {
  void startDialogue(NPC npc) {
    int dialogueIndex = 0;
    while (true) {
      Dialogue currentDialogue = npc.getDialogue(dialogueIndex);
      debugPrint(currentDialogue.text); // Display dialogue text
      if (currentDialogue.options.isEmpty) break; // End if no options

      // Display options and get player's choice
      for (int i = 0; i < currentDialogue.options.length; i++) {
        debugPrint("${i + 1}. ${currentDialogue.options[i]}");
      }

      int choice = getPlayerChoice(); // Assume a function to get player input
      dialogueIndex =
          currentDialogue.nextDialogue[currentDialogue.options[choice - 1]] ??
              0;
    }
  }

  int getPlayerChoice() {
    // Implement logic to get player input (stubbed for now)
    return 1; // Placeholder
  }
}
