import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
          children: [
            _buildPartyMember('lib/assets/images/icons/axe.svg'),
            _buildPartyMember('lib/assets/images/icons/shield.svg'),
            _buildPartyMember('lib/assets/images/icons/broadsword.svg'),
            _buildPartyMember('lib/assets/images/icons/dagger.svg'),
            _buildPartyMember('lib/assets/images/icons/flame.svg'),
            _buildPartyMember('lib/assets/images/icons/health.svg'),
          ],
        ),
      ),
    );
  }

  Widget _buildPartyMember(String avatar) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: CircleAvatar(
          radius: 24,
          backgroundColor: Colors.grey[300], // Optional background color
          child: ClipOval(
            child: SvgPicture.asset(
              avatar,
              width: 24,
              height: 24,
              fit: BoxFit.cover,
            ),
          ),
        ));
  }
}
