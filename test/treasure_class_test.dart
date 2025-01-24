import 'package:flutter_test/flutter_test.dart';
import 'package:soulforge/models/items/item.dart';
import 'package:soulforge/models/entities/treasure_class.dart';

void main() {
  test('Treasure class items size should be increased', () {
    final item =
        Item(name: "Cloak", description: "A basic cloak", basePrice: 100);
    var treasureClass = TreasureClass();
    treasureClass.addItem(item);
    expect(treasureClass.items.length, 1);
  });
}
