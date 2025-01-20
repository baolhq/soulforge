import 'package:uuid/uuid.dart';

class Area {
  late String id;
  final String name;
  final String description;

  Area({required this.name, required this.description}) {
    id = Uuid().v4();
  }
}
