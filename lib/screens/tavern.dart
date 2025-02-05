import 'package:flutter/material.dart';
import 'package:soulforge/screens/shared/persistent_scaffold.dart';

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
    return PersistentScaffold(
      title: "Tavern",
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
}
