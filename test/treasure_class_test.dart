import 'package:flutter_test/flutter_test.dart';
import 'package:soulforge/models/item.dart';
import 'package:soulforge/models/treasure_class.dart';

void main() {
  test('Treasure class items size should be increased', () {
    final item =
        Item(name: "Cloak", description: "A basic cloak", basePrice: 100);
    var treasureClass = TreasureClass();
    treasureClass.addItem(item);
    expect(treasureClass.items.length, 1);
  });
}
