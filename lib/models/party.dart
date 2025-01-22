import 'package:soulforge/models/character.dart';

class Party {
  final int? id;
  String name;
  late List<List<Character>> members;

  Party({required this.name, this.id}) {
    members = List.empty(growable: true);
  }
}
