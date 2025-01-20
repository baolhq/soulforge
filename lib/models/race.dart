import 'package:uuid/uuid.dart';

class Race {
  late String id;
  final String name;
  final String description;

  Race({required this.name, required this.description}) {
    id = Uuid().v4();
  }
}
