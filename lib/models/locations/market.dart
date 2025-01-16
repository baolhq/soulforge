// market.dart
//
// Focuses on buying and selling items with multiple vendors.

import 'package:soulforge/models/character.dart';
import 'package:soulforge/models/item.dart';
import 'package:soulforge/models/locations/location.dart';
import 'package:soulforge/models/npcs/npc.dart';
import 'package:soulforge/models/npcs/vendor.dart';

class Market extends Location {
  late List<NPC> npcs;

  Market(String name, String description, List<Location> nearbyLocations)
      : super(
            name: name,
            description: description,
            nearbyLocations: nearbyLocations) {
    npcs = List.empty(growable: true);
  }

  void addNPC(NPC npc) {
    npcs.add(npc);
  }

  void buyItem(Character buyer, Vendor vendor, Item item) {
    // Implement logic for buying item
  }

  void sellItem(Character seller, Vendor vendor, Item item) {
    // Implement logic for selling item
  }
}
