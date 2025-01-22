import 'dart:math';

import 'package:soulforge/models/item.dart';

class TreasureClass {
  final int? id;
  final int tier;
  double totalDropRate;
  late List<Item> items;

  TreasureClass({this.tier = 0, this.id, this.totalDropRate = 0}) {
    items = List.empty(growable: true);
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
