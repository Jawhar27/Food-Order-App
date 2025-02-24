import 'package:food_order_app/data/models/food_item/meta_data.dart';
import 'package:food_order_app/data/models/food_item/modifier_group_rules.dart';
import 'package:food_order_app/data/models/food_item/nutrient_data.dart';
import 'package:food_order_app/data/models/food_item/price_info.dart';
import 'package:food_order_app/data/models/food_item/product_info.dart';
import 'package:food_order_app/data/models/food_item/quantity_info.dart';

class FoodItem {
  final String id;
  final String menuItemId;
  final String storeId;
  final Map<String, String> title;
  final Map<String, String> description;
  final String imageUrl;
  final PriceInfo priceInfo;
  final QuantityInfo quantityInfo;
  final ModifierGroupRules modifierGroupRules;
  final int aggregatedProductRating;
  final int totalReviews;
  final String createdDate;
  final String modifiedDate;
  final NutrientData nutrientData;
  final ProductInfo productInfo;
  final List<String>? categoryIds;
  final MetaData metaData;

  FoodItem({
    required this.id,
    required this.menuItemId,
    required this.storeId,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.priceInfo,
    required this.quantityInfo,
    required this.modifierGroupRules,
    required this.aggregatedProductRating,
    required this.totalReviews,
    required this.createdDate,
    required this.modifiedDate,
    required this.nutrientData,
    required this.productInfo,
    required this.categoryIds,
    required this.metaData,
  });

  factory FoodItem.fromJson(Map<String, dynamic> json) {
    return FoodItem(
      id: json['ID'],
      menuItemId: json['MenuItemID'],
      storeId: json['StoreID'],
      title: Map<String, String>.from(json['Title']),
      description: Map<String, String>.from(json['Description']),
      imageUrl: json['ImageURL'],
      priceInfo: PriceInfo.fromJson(json['PriceInfo']),
      quantityInfo: QuantityInfo.fromJson(json['QuantityInfo']),
      modifierGroupRules:
          ModifierGroupRules.fromJson(json['ModifierGroupRules']),
      aggregatedProductRating: json['AggregatedProductRating'],
      totalReviews: json['TotalReviews'],
      createdDate: json['CreatedDate'],
      modifiedDate: json['ModifiedDate'],
      nutrientData: NutrientData.fromJson(json['NutrientData']),
      productInfo: ProductInfo.fromJson(json['ProductInfo']),
      categoryIds: List<String>.from(json['CategoryIDs']??[]),
      metaData: MetaData.fromJson(json['MetaData']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ID': id,
      'MenuItemID': menuItemId,
      'StoreID': storeId,
      'Title': title,
      'Description': description,
      'ImageURL': imageUrl,
      'PriceInfo': priceInfo.toJson(),
      'QuantityInfo': quantityInfo.toJson(),
      'ModifierGroupRules': modifierGroupRules.toJson(),
      'AggregatedProductRating': aggregatedProductRating,
      'TotalReviews': totalReviews,
      'CreatedDate': createdDate,
      'ModifiedDate': modifiedDate,
      'NutrientData': nutrientData.toJson(),
      'ProductInfo': productInfo.toJson(),
      'CategoryIDs': categoryIds,
      'MetaData': metaData.toJson(),
    };
  }
}
