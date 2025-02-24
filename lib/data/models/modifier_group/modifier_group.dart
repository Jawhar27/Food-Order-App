import 'package:food_order_app/data/models/modifier_group/modifier_option.dart';

class ModifierGroup {
  final String id;
  final String modifierGroupId;
  final Map<String, String> title;
  final Map<String, String> description;
  final String storeId;
  final String displayType;
  final List<ModifierOptions> modifierOptions;
  final Map<String, dynamic> quantityConstraintsRules;
  final String createdDate;
  final String modifiedDate;
  final dynamic metaData;

  ModifierGroup({
    required this.id,
    required this.modifierGroupId,
    required this.title,
    required this.description,
    required this.storeId,
    required this.displayType,
    required this.modifierOptions,
    required this.quantityConstraintsRules,
    required this.createdDate,
    required this.modifiedDate,
    this.metaData,
  });

  factory ModifierGroup.fromJson(Map<String, dynamic> json) {
    var optionsList = json['ModifierOptions'] as List;
    List<ModifierOptions> options = optionsList.map((option) => ModifierOptions.fromJson(option)).toList();

    return ModifierGroup(
      id: json['ID'],
      modifierGroupId: json['ModifierGroupID'],
      title: Map<String, String>.from(json['Title']),
      description: Map<String, String>.from(json['Description']),
      storeId: json['StoreID'],
      displayType: json['DisplayType'],
      modifierOptions: options,
      quantityConstraintsRules: json['QuantityConstraintsRules'],
      createdDate: json['CreatedDate'],
      modifiedDate: json['ModifiedDate'],
      metaData: json['MetaData'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ID': id,
      'ModifierGroupID': modifierGroupId,
      'Title': title,
      'Description': description,
      'StoreID': storeId,
      'DisplayType': displayType,
      'ModifierOptions': modifierOptions.map((e) => e.toJson()).toList(),
      'QuantityConstraintsRules': quantityConstraintsRules,
      'CreatedDate': createdDate,
      'ModifiedDate': modifiedDate,
      'MetaData': metaData,
    };
  }
}
