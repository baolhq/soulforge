import 'package:flutter/material.dart';
import 'package:soulforge/screens/town.dart';

class DistributionScreen extends StatefulWidget {
  final String characterName;
  final String selectedAvatar;
  final String selectedRace;
  final String raceDescription;

  const DistributionScreen(
      {super.key,
      required this.characterName,
      required this.selectedAvatar,
      required this.selectedRace,
      required this.raceDescription});

  @override
  State<DistributionScreen> createState() => _DistributionScreenState();
}

class _DistributionScreenState extends State<DistributionScreen> {
  final int maxStat = 15;
  final int minStat = 5;
  int remainingPoints = 10;

  final Map<String, int> stats = {
    'Strength': 10,
    'Dexterity': 10,
    'Intelligence': 10,
    'Wisdom': 10,
    'Constitution': 10,
    'Charisma': 10,
    'Luck': 10,
  };

  void _updateStat(String stat, int delta) {
    if (delta > 0 && remainingPoints <= 0) return;

    setState(() {
      final newValue = (stats[stat]! + delta).clamp(minStat, maxStat);
      if (newValue != stats[stat]) {
        stats[stat] = newValue;
        remainingPoints -= delta;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stat Distribution')),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Avatar & Name Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.blue,
                      child: Icon(Icons.account_circle,
                          size: 32, color: Colors.white),
                    ),
                    SizedBox(width: 16),
                    Text(
                      widget.characterName,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 16),

                // Perk & Race Description
                Text(
                  "Race: ${widget.selectedRace}",
                  style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                ),
                Text(
                  widget.raceDescription,
                  style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                ),
                SizedBox(height: 24),

                // Remaining Points Display
                Tooltip(
                  message:
                      "You need to spend all attribute points before continue",
                  triggerMode: TooltipTriggerMode.longPress,
                  child: Text(
                    "Remaining Points: $remainingPoints",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 12),

                // Stat Distribution Section
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: stats.keys.map((stat) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(stat, style: TextStyle(fontSize: 16)),
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.remove),
                                style: IconButton.styleFrom(
                                    backgroundColor:
                                        Color.fromARGB(50, 0, 0, 50)),
                                onPressed: stats[stat]! > minStat
                                    ? () => _updateStat(stat, -1)
                                    : null,
                              ),
                              Container(
                                width: 50,
                                alignment: Alignment.center,
                                child: Text(
                                  stats[stat]!.toString(),
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                              IconButton(
                                icon: Icon(Icons.add),
                                style: IconButton.styleFrom(
                                    backgroundColor:
                                        Color.fromARGB(50, 0, 0, 50)),
                                onPressed: (stats[stat]! < maxStat &&
                                        remainingPoints > 0)
                                    ? () => _updateStat(stat, 1)
                                    : null,
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
                Spacer(),
              ],
            ),
          ),

          // Confirm button
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: ElevatedButton(
              onPressed: () {
                if (remainingPoints == 0) {
                  debugPrint("Stat distributed");
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => TownScreen()));
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 40),
              ),
              child: Text('Confirm'),
            ),
          ),
        ],
      ),
    );
  }
}
