import 'package:soulforge/enums/modifier_type.dart';
import 'package:soulforge/enums/stat_attribute.dart';

class StatModifier {
  final StatAttribute attribute;
  final ModifierType type;
  final double value;

  StatModifier(
      {required this.attribute, required this.type, required this.value});

  @override
  String toString() {
    String modifierSign = type == ModifierType.flat ? '' : '%';
    return '${attribute.name}: $value$modifierSign (${type.name})';
  }
}
