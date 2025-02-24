import 'package:food_order_app/data/models/menu/menu_availability.dart';

class FoodMenu {
  final String id;
  final String menuID;
  final String verticalID;
  final String storeID;
  final Map<String, String> title; // Assuming it's a map for different languages
  final String? subTitle;
  final String? description;
  final Map<String, MenuAvailability> menuAvailability; // Changed to use MenuAvailability class
  final List<String> menuCategoryIDs;
  final String createdDate;
  final String modifiedDate;
  final String createdBy;
  final String modifiedBy;

  // Constructor
  FoodMenu({
    required this.id,
    required this.menuID,
    required this.verticalID,
    required this.storeID,
    required this.title,
    this.subTitle,
    this.description,
    required this.menuAvailability,
    required this.menuCategoryIDs,
    required this.createdDate,
    required this.modifiedDate,
    required this.createdBy,
    required this.modifiedBy,
  });

  // Method to create a FoodMenu object from JSON
  factory FoodMenu.fromJson(Map<String, dynamic> json) {
    return FoodMenu(
      id: json['ID'],
      menuID: json['MenuID'],
      verticalID: json['VerticalID'],
      storeID: json['StoreID'],
      title: Map<String, String>.from(json['Title']),
      subTitle: json['SubTitle'],
      description: json['Description'],
      menuAvailability: Map<String, MenuAvailability>.from(
        json['MenuAvailability'].map(
          (key, value) => MapEntry(key, MenuAvailability.fromJson(value)),
        ),
      ),
      menuCategoryIDs: List<String>.from(json['MenuCategoryIDs']),
      createdDate: json['CreatedDate'],
      modifiedDate: json['ModifiedDate'],
      createdBy: json['CreatedBy'],
      modifiedBy: json['ModifiedBy'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ID': id,
      'MenuID': menuID,
      'VerticalID': verticalID,
      'StoreID': storeID,
      'Title': title,
      'SubTitle': subTitle,
      'Description': description,
      'MenuAvailability': menuAvailability.map((key, value) => MapEntry(key, value.toJson())),
      'MenuCategoryIDs': menuCategoryIDs,
      'CreatedDate': createdDate,
      'ModifiedDate': modifiedDate,
      'CreatedBy': createdBy,
      'ModifiedBy': modifiedBy,
    };
  }
}
