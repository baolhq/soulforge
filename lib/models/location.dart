import 'package:uuid/uuid.dart';

class Location {
  late String id;
  final String name;
  final String description;
  final int levelRequirement;
  double spawnRate;

  Location(
      {required this.name,
      required this.description,
      this.levelRequirement = 0,
      this.spawnRate = 0}) {
    id = Uuid().v4();
  }
}
