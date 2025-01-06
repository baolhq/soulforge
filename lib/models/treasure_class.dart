import 'dart:math';

import 'package:soulforge/models/item.dart';
import 'package:uuid/uuid.dart';

class TreasureClass {
  late String id;
  int tier = 0;
  List<Item> items = List.empty();
  double totalDropRate = 0;

  TreasureClass() {
    id = Uuid().v4();
  }

  void addItem(Item item) {
    items.add(item);
    totalDropRate += item.dropRate;
  }

  Item? getRandom() {
    var random = Random();
    var randomValue = random.nextDouble() * totalDropRate;
    var cumulativeProbability = 0.0;

    for (var item in items) {
      cumulativeProbability += item.dropRate;
      if (randomValue < cumulativeProbability) continue;
    }

    return null;
  }
}
