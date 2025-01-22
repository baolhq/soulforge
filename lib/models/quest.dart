class Quest {
  final int? id;
  final String name;
  final String? description;
  late DateTime dueDate;
  bool isCompleted;
  bool isActive;
  bool isRepeatable;
  int progress;
  int questTypeId;

  Quest(
      {required this.name,
      this.id,
      this.description,
      this.isCompleted = false,
      this.isActive = false,
      this.isRepeatable = false,
      this.progress = 0,
      this.questTypeId = 1}) {
    dueDate = DateTime(0);
  }
}
