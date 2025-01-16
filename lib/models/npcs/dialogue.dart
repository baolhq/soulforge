import 'package:uuid/uuid.dart';

class Dialogue {
  late String id;
  String text;
  List<String> options;
  late Map<String, int> nextDialogue;

  Dialogue({required this.text, required this.options}) {
    id = Uuid().v4();
    nextDialogue = {};
  }
}
