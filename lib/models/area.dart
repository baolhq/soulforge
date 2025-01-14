import 'package:soulforge/models/location.dart';
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
}
