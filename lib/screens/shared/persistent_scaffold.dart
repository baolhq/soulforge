import 'package:flutter/material.dart';

class PersistentScaffold extends StatelessWidget {
  final Widget body;
  final String title;

  const PersistentScaffold({
    super.key,
    required this.body,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Open settings
            },
          ),
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
          Expanded(child: body),
          _buildBottomBar(), // Persistent bottom bar
        ],
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
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
    );
  }

  Widget _buildPartyMember(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: CircleAvatar(
        radius: 24,
        backgroundImage: AssetImage("assets/character_$index.png"),
      ),
    );
  }
}
