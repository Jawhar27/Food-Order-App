class ModifierGroupRules {
  final List<String>? ids;
  final List<dynamic>? overrides;

  ModifierGroupRules({
    required this.ids,
    required this.overrides,
  });

  factory ModifierGroupRules.fromJson(Map<String, dynamic> json) {
    return ModifierGroupRules(
      ids: List<String>.from(json['IDs']??[]),
      overrides: List<dynamic>.from(json['Overrides'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'IDs': ids,
      'Overrides': overrides,
    };
  }
}
