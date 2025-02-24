import 'package:food_order_app/data/models/category/menu_entity.dart';

class FoodCategory {
  final String id;
  final String menuCategoryID;
  final String menuID;
  final String storeID;
  final Map<String, String> title;
  final Map<String, String> subTitle;
  final List<MenuEntity> menuEntities; 
  final String createdDate;
  final String modifiedDate;
  final String createdBy;
  final String modifiedBy;

  FoodCategory({
    required this.id,
    required this.menuCategoryID,
    required this.menuID,
    required this.storeID,
    required this.title,
    required this.subTitle,
    required this.menuEntities,
    required this.createdDate,
    required this.modifiedDate,
    required this.createdBy,
    required this.modifiedBy,
  });

  factory FoodCategory.fromJson(Map<String, dynamic> json) {
    return FoodCategory(
      id: json['ID'],
      menuCategoryID: json['MenuCategoryID'],
      menuID: json['MenuID'],
      storeID: json['StoreID'],
      title: Map<String, String>.from(json['Title']),
      subTitle: Map<String, String>.from(json['SubTitle']),
      menuEntities: List<MenuEntity>.from(
        json['MenuEntities'].map((item) => MenuEntity.fromJson(item)),
      ),
      createdDate: json['CreatedDate'],
      modifiedDate: json['ModifiedDate'],
      createdBy: json['CreatedBy'],
      modifiedBy: json['ModifiedBy'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ID': id,
      'MenuCategoryID': menuCategoryID,
      'MenuID': menuID,
      'StoreID': storeID,
      'Title': title,
      'SubTitle': subTitle,
      'MenuEntities': menuEntities.map((e) => e.toJson()).toList(),
      'CreatedDate': createdDate,
      'ModifiedDate': modifiedDate,
      'CreatedBy': createdBy,
      'ModifiedBy': modifiedBy,
    };
  }
}
