import 'package:flutter/material.dart';
import 'package:soulforge/helpers/database.dart';
import 'package:soulforge/models/entities/races.dart';
import 'package:soulforge/screens/distribution.dart';

class CreationScreen extends StatefulWidget {
  const CreationScreen({super.key});

  @override
  State<CreationScreen> createState() => _CreationScreenState();
}

class _CreationScreenState extends State<CreationScreen> {
  final TextEditingController _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late Future<List<Race>> _racesFuture;
  int _selectedAvatarIndex = 0;
  int _selectedRaceIndex = 0;

  final Database _db = Database();
  late final RaceDao _raceDao = RaceDao(_db);

  @override
  void initState() {
    super.initState();
    _racesFuture = _initializeData();
  }

  Future<List<Race>> _initializeData() async {
    await _db.seedRaces();
    return _raceDao.getAllRaces();
  }

  final List<String> avatars = [
    'Avatar 1',
    'Avatar 2',
    'Avatar 3',
    'Avatar 1',
    'Avatar 2',
    'Avatar 3',
    'Avatar 1',
    'Avatar 2',
    'Avatar 3',
    'Avatar 1',
    'Avatar 2',
    'Avatar 3',
    'Avatar 1',
    'Avatar 2',
    'Avatar 3',
    'Avatar 1',
    'Avatar 2',
    'Avatar 3',
  ];

  void _onAvatarSwipe(int index) {
    setState(() {
      _selectedAvatarIndex = index;
    });
  }

  void _onRaceSelect(int index) {
    setState(() {
      _selectedRaceIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Your Character'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Avatar Selection
            SizedBox(
              height: 100,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: avatars.length,
                separatorBuilder: (context, index) => SizedBox(width: 16),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => _onAvatarSwipe(index),
                    child: Column(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _selectedAvatarIndex == index
                                ? Colors.blueAccent
                                : Colors.grey[300],
                          ),
                          child: Center(
                            child: Text(
                              avatars[index],
                              style: TextStyle(fontSize: 10),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Avatar ${index + 1}',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: _selectedAvatarIndex == index
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16),

            // Name Input Field
            Form(
              key: _formKey,
              child: TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: "Character Name",
                  hintText: "Enter your hero's name...",
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.shuffle),
                    onPressed: () {
                      setState(() {
                        _nameController.text =
                            "RandomName${_selectedAvatarIndex + 1}";
                      });
                    },
                  ),
                ),
                maxLength: 12,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Name cannot be empty';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 16),

            // Race Selection with FutureBuilder
            Expanded(
              // This allows the ListView to take available space
              child: FutureBuilder<List<Race>>(
                future: _racesFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No races found.'));
                  } else {
                    final races = snapshot.data ?? [];
                    return ListView.builder(
                      itemCount: races.length,
                      itemBuilder: (context, index) {
                        final race = races[index];
                        final isSelected = _selectedRaceIndex == index;

                        return Material(
                          color: isSelected
                              ? Colors.blue.withAlpha(50)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                          child: ListTile(
                            leading: Icon(Icons.person),
                            title: Text(race.name),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Perk: ${race.perk}',
                                  style: TextStyle(fontSize: 12.0),
                                ),
                                SizedBox(height: 4),
                                Text(race.description ?? ''),
                              ],
                            ),
                            isThreeLine: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            onTap: () => _onRaceSelect(index),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),

            SizedBox(height: 16), // Ensure spacing for the button

            // Confirm Button
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _racesFuture.then((races) {
                    if (!context.mounted) return;

                    final selectedAvatar = avatars[_selectedAvatarIndex];
                    final selectedRace = races[_selectedRaceIndex].name;
                    final characterName = _nameController.text;

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DistributionScreen()));

                    debugPrint(
                        "Avatar: $selectedAvatar, Race: $selectedRace, Name: $characterName");
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 40),
              ),
              child: Text("Confirm"),
            ),
          ],
        ),
      ),
    );
  }
}
