import 'package:soulforge/models/locations/location.dart';
import 'package:uuid/uuid.dart';

class Area {
  late String id;
  final String name;
  final String description;
  final List<Area> nearbyAreas;
  final List<Location> locations;

  Area(
      {required this.name,
      required this.description,
      required this.nearbyAreas,
      required this.locations}) {
    id = Uuid().v4();
  }

  /// Get the minimum level requirement for this area
  /// base on the lowest location level requirement.
  int getLevelRequirement() {
    int minLevel = 100;

    for (var location in locations) {
      if (minLevel < location.levelRequirement) {
        minLevel = location.levelRequirement;
      }
    }

    return minLevel;
  }
}
