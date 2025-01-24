class Location {
  final int? id;
  final String name;
  final String? description;
  final int? levelRequirement;
  double? spawnRate;
  final int areaId;

  Location(
      {required this.name,
      required this.description,
      this.id,
      this.levelRequirement,
      this.spawnRate,
      this.areaId = 1});
}
