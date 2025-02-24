class ModifierOptions {
  final String? id;
  final String? type;

  ModifierOptions({required this.id, required this.type});

  factory ModifierOptions.fromJson(Map<String, dynamic> json) {
    return ModifierOptions(
      id: json['Id'],
      type: json['Type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Type': type,
    };
  }
}
