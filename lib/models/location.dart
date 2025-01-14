import 'package:uuid/uuid.dart';

class Location {
  late String id;
  final String name;
  final String description;
  int levelRequirement;

  Location(
      {required this.name,
      required this.description,
      this.levelRequirement = 0}) {
    id = Uuid().v4();
  }
}
