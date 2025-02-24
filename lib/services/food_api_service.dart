import 'package:food_order_app/data/food_api_respone.dart';
import 'package:food_order_app/data/models/category/food_category.dart';
import 'package:food_order_app/data/models/food_item/food_item.dart';
import 'package:food_order_app/data/models/menu/food_menu.dart';
import 'package:food_order_app/data/models/modifier_group/modifier_group.dart';

class FoodApiService {
  final Map<String, dynamic> result =
      foodApiResponse['Result'] as Map<String, dynamic>;

  List<FoodMenu> getMenu() {
    return List<FoodMenu>.from(
      result['Menu'].map((item) => FoodMenu.fromJson(item)),
    );
  }

  List<FoodCategory> getCategories({required List<String> menuCategoryIds}) {
    return List<FoodCategory>.from(
      result['Categories'].where((item) {
        var menucatId = item['MenuCategoryID'];
        return menuCategoryIds.contains(menucatId);
      }).map((item) => FoodCategory.fromJson(item)),
    );
  }

  List<FoodItem> getItems({required List<String> menuEntityIds}) {
    return List<FoodItem>.from(
      result['Items'].where((item) {
        var menuItemId = item['MenuItemID'];
        return menuEntityIds.contains(menuItemId);
      }).map((item) => FoodItem.fromJson(item)),
    );
  }

  List<ModifierGroup> getModifierGroups({required List<String> modifierGroupIds}) {
    return List<ModifierGroup>.from(
      result['ModifierGroups'].where((item) {
        var modifierGroupId = item['ModifierGroupID'];
        return modifierGroupIds.contains(modifierGroupId);
      }).map((item) => ModifierGroup.fromJson(item)),
    );
  }
}
