import 'package:soulforge/models/character.dart';
import 'package:uuid/uuid.dart';

class Party {
  late String id;
  String name = "";
  List<Character> members = List.empty();

  Party() {
    id = Uuid().v4();
  }
}
