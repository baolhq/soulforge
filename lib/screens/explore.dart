import 'package:flutter/material.dart';
import 'package:soulforge/screens/dungeon.dart';
import 'package:soulforge/screens/shared/persistent_scaffold.dart'; // Import dungeon screen

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final Map<String, List<String>> locationsByArea = {
    "Forest": ["Ancient Ruins", "Goblin Hideout"],
    "Mountains": ["Frozen Cavern", "Abandoned Mine"],
    "Swamp": ["Witch's Hut", "Sunken Temple"],
  };

  @override
  Widget build(BuildContext context) {
    return PersistentScaffold(
      title: "Explore",
      body: ListView(
        children: locationsByArea.keys.map((area) {
          return ExpansionTile(
            title: Text(area),
            shape: Border.all(color: Colors.transparent),
            collapsedShape: Border.all(color: Colors.transparent),
            children: locationsByArea[area]!
                .map((location) => ListTile(
                      title: Text(
                        location,
                        style: TextStyle(fontSize: 14),
                      ),
                      trailing: const Icon(Icons.arrow_forward),
                      onTap: () => _confirmEntry(location),
                    ))
                .toList(),
          );
        }).toList(),
      ),
    );
  }

  void _confirmEntry(String location) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Enter $location?"),
        content: const Text("Are you sure you want to explore this location?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DungeonScreen(location: location)),
              );
            },
            child: const Text("Enter"),
          ),
        ],
      ),
    );
  }
}
