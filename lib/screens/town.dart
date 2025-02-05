import 'package:flutter/material.dart';
import 'package:soulforge/screens/academy.dart';
import 'package:soulforge/screens/arena.dart';
import 'package:soulforge/screens/shared/persistent_scaffold.dart';
import 'package:soulforge/screens/crafting.dart';
import 'package:soulforge/screens/explore.dart';
import 'package:soulforge/screens/market.dart';
import 'package:soulforge/screens/party.dart';
import 'package:soulforge/screens/setting.dart';
import 'package:soulforge/screens/smithy.dart';
import 'package:soulforge/screens/tavern.dart';
import 'package:soulforge/screens/training.dart';

/// The main screen where player accesses other features, meets people, and gets quests.
class TownScreen extends StatelessWidget {
  const TownScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentScaffold(
      title: "Town",
      body: Column(
        children: [
          // Town Image
          SizedBox(
            height: 200,
            width: double.infinity,
            child: Image.asset(
              'assets/town.png',
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 10),

          // Buildings Grid
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.all(10),
              crossAxisCount: 2,
              childAspectRatio: 3 / 1,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: [
                _buildBuildingButton(
                    Icons.local_bar, "Tavern", context, TavernScreen()),
                _buildBuildingButton(
                    Icons.explore, "Explore", context, ExploreScreen()),
                _buildBuildingButton(
                    Icons.store, "Market", context, MarketScreen()),
                _buildBuildingButton(
                    Icons.water_drop, "Crafting", context, CraftingScreen()),
                _buildBuildingButton(
                    Icons.groups, "Party", context, PartyScreen()),
                _buildBuildingButton(
                    Icons.construction, "Smithy", context, SmithyScreen()),
                _buildBuildingButton(
                    Icons.school, "Academy", context, AcademyScreen()),
                _buildBuildingButton(
                    Icons.sports_mma, "Arena", context, ArenaScreen()),
                _buildBuildingButton(Icons.fitness_center, "Training", context,
                    TrainingScreen()),
                _buildBuildingButton(
                    Icons.tune, "Settings", context, SettingScreen()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBuildingButton(
      IconData icon, String label, BuildContext context, Widget targetScreen) {
    return SizedBox(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0))),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => targetScreen));
        },
        child: Row(
          children: [
            const SizedBox(width: 16),
            Icon(icon, size: 24),
            const SizedBox(width: 16),
            Text(label, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
