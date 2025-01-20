import 'package:soulforge/models/character.dart';
import 'package:uuid/uuid.dart';

class Party {
  late String id;
  String name;
  late List<List<Character>> members;

  Party({required this.name}) {
    id = Uuid().v4();
    members = List.empty(growable: true);
  }
}
