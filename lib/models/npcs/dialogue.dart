class Dialogue {
  String text;
  List<String> options;
  late Map<String, int> nextDialogue;

  Dialogue({required this.text, required this.options}) {
    nextDialogue = {};
  }
}
