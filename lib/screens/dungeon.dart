import 'package:flutter/material.dart';

/// The local blacksmith help the player party to upgrade their weapons,
/// equipments or fix broken ones.
class DungeonScreen extends StatefulWidget {
  final String location;

  const DungeonScreen({super.key, required this.location});

  @override
  State<DungeonScreen> createState() => _DungeonScreenState();
}

class _DungeonScreenState extends State<DungeonScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
