import 'package:flutter/material.dart';

class TavernScreen extends StatefulWidget {
  const TavernScreen({super.key});

  @override
  State<TavernScreen> createState() => _TavernScreenState();
}

class _TavernScreenState extends State<TavernScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context), // Go back to Town
        ),
        title: const Text("Tavern"),
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
          // Tavern Image
          SizedBox(
            height: 200,
            width: double.infinity,
            child: Image.asset(
              'assets/tavern.png', // Replace with actual image
              fit: BoxFit.cover,
            ),
          ),

          // Tab Bar
          TabBar(
            controller: _tabController,
            tabs: const [
              Tab(icon: Icon(Icons.person_add), text: "Recruit"),
              Tab(icon: Icon(Icons.assignment), text: "Bounties"),
              Tab(icon: Icon(Icons.lock), text: "Vault"),
            ],
          ),

          // Tab Views
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildRecruitTab(),
                _buildBountiesTab(),
                _buildVaultTab(),
              ],
            ),
          ),

          // Persistent Party Bar
          _buildPartyBar(),
        ],
      ),
    );
  }

  Widget _buildRecruitTab() {
    return Center(child: Text("Recruit new members here"));
  }

  Widget _buildBountiesTab() {
    return Center(child: Text("Accept new quests here"));
  }

  Widget _buildVaultTab() {
    return Center(child: Text("Store valuables here"));
  }

  Widget _buildPartyBar() {
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
        radius: 30,
        backgroundImage: AssetImage(
            "assets/character_$index.png"), // Replace with actual avatars
      ),
    );
  }
}
