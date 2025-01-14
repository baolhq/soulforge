import 'package:flutter_test/flutter_test.dart';
import 'package:soulforge/models/item.dart';
import 'package:soulforge/models/treasure_class.dart';

void main() {
  test('Treasure class items size should be increased', () {
    final item = Item(
      name: "Cloak",
      description: "A basic cloak",
      isCraftable: false,
      craftingRecipe: List.empty(),
    );
    var treasureClass = TreasureClass(items: [item]);
    treasureClass.addItem(item);
    expect(treasureClass.items.length, 1);
  });
}
