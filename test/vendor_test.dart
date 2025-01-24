import 'package:flutter_test/flutter_test.dart';
import 'package:soulforge/models/entities/character.dart';
import 'package:soulforge/models/items/item.dart';
import 'package:soulforge/models/npcs/vendor.dart';
import 'package:soulforge/models/equipments/weapon.dart';

void main() {
  test("Bob's gold should be 155", () {
    final Character bob = Character(name: "Bob", gold: 300);
    final Vendor merchant = Vendor(name: "Merchant", background: "");
    final Item sword = Weapon(
        name: "Longsword",
        description: "",
        basePrice: 100,
        baseUpgradePrice: 100,
        weaponTypeId: 1);

    merchant.inventory.add(sword);
    merchant.sellItem(bob, sword);

    // No bribe involving, so bribeModifier is 1
    // Since Bob's default charisma is 1, the charismaModifier is 1.45
    // Final price: 100 * (1 * 1.45) = 145
    // Bob's gold: 300 - 145 => 155
    expect(bob.gold, 155);
  });
}
