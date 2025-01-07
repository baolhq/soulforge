import 'package:soulforge/models/character.dart';
import 'package:uuid/uuid.dart';

class Party {
  late String id;
  String name = "";
  List<Character> members = List.empty(growable: true);

  Party() {
    id = Uuid().v4();
  }
}
