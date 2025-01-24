import 'package:flutter/material.dart';

class CreationScreen extends StatefulWidget {
  const CreationScreen({super.key});

  @override
  State<CreationScreen> createState() => _CreationScreenState();
}

class _CreationScreenState extends State<CreationScreen> {
  final TextEditingController _nameController = TextEditingController();
  late Future<List<Map<String, dynamic>>> _racesFuture;
  int _selectedAvatarIndex = 0;
  int _selectedRaceIndex = 0;

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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Avatar Selection
            SizedBox(
              height: 100, // Adjusted height for smaller avatars
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
                          width: 60, // Smaller size for avatars
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
            TextField(
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
            ),
            SizedBox(height: 16),

            // Race Selection with FutureBuilder
            Expanded(
              child: FutureBuilder<List<Map<String, dynamic>>>(
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
                    final races = snapshot.data!;
                    return ListView.builder(
                      itemCount: races.length,
                      itemBuilder: (context, index) {
                        final race = races[index];
                        return ListTile(
                          leading: Icon(Icons.person),
                          title: Text(race['name']!),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                race['description']!,
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Text(
                                'Perk: ${race['perk']}',
                                style: TextStyle(fontSize: 12.0),
                              ),
                            ],
                          ),
                          isThreeLine: true,
                          trailing: _selectedRaceIndex == index
                              ? Icon(Icons.check_circle, color: Colors.green)
                              : null,
                          onTap: () => _onRaceSelect(index),
                        );
                      },
                    );
                  }
                },
              ),
            ),

            // Confirm Button
            ElevatedButton(
              onPressed: () {
                if (_nameController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Please enter a name!")),
                  );
                  return;
                }

                _racesFuture.then((races) {
                  final selectedAvatar = avatars[_selectedAvatarIndex];
                  final selectedRace = races[_selectedRaceIndex]['name'];
                  final characterName = _nameController.text;

                  debugPrint(
                      "Avatar: $selectedAvatar, Race: $selectedRace, Name: $characterName");
                });
              },
              child: Text("Confirm"),
            ),
          ],
        ),
      ),
    );
  }
}
