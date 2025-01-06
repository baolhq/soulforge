import 'package:uuid/uuid.dart';

class Location {
  late String id;
  String name = "";
  String description = "";
  int levelRequirement = 0;

  Location() {
    id = Uuid().v4();
  }
}
