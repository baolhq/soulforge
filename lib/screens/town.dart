import 'package:flutter/material.dart';
import 'package:soulforge/screens/tavern.dart';

/// The main screen where player accesses other features, meets people, and gets quests.
class TownScreen extends StatelessWidget {
  const TownScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {
            // Open settings
          },
        ),
        title: const Text("Town"),
        actions: [
          IconButton(
            icon: const Icon(Icons.emoji_events),
            onPressed: () {
              // Handle premium access
            },
          ),
        ],
      ),
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
                _buildBuildingButton(Icons.local_bar, "Tavern", context),
                _buildBuildingButton(Icons.explore, "Explore", context),
                _buildBuildingButton(Icons.store, "Market", context),
                _buildBuildingButton(Icons.groups, "Party", context),
                _buildBuildingButton(Icons.construction, "Smithy", context),
                _buildBuildingButton(Icons.school, "Academy", context),
                _buildBuildingButton(Icons.sports_mma, "Arena", context),
                _buildBuildingButton(
                    Icons.local_fire_department, "Forge", context),
                _buildBuildingButton(Icons.fitness_center, "Training", context),
                _buildBuildingButton(Icons.menu_book, "Library", context),
              ],
            ),
          ),

          // Party Display
          Container(
            height: 80,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            color: Colors.black54,
            child: Center(
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: List.generate(6, (index) => _buildPartyMember(index)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBuildingButton(
      IconData icon, String label, BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0))),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => TavernScreen()));
        },
        child: Row(
          children: [
            SizedBox(width: 16),
            Icon(icon, size: 24),
            SizedBox(width: 16),
            Text(label, textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }

  Widget _buildPartyMember(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: CircleAvatar(
        radius: 24,
        backgroundImage: AssetImage(
            "assets/character_$index.png"), // Replace with actual character avatar
      ),
    );
  }
}
