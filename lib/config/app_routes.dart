import 'package:flutter/material.dart';
import 'package:food_order_app/screens/menu_item_screen.dart';
import 'package:food_order_app/screens/menu_category_screen.dart';
import 'package:food_order_app/screens/menu_list_screen.dart';
import 'package:food_order_app/screens/modifier_rules_screen.dart';
import 'package:food_order_app/screens/splash_screen.dart';

class AppRoutes {
  static const String toSplashScreen = 'toSplashScreen';
  static const String toMainScreen = 'toMainScreen';
  static const String toCategoryScreen = 'toCategoryScreen';
  static const String toMenuListScreen = 'toMenuListScreen';
  static const String toModifierRulesScreen = 'toModifierRulesScreen';
}

class OnRouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.toMainScreen:
        final arguments = settings.arguments is Map<String, dynamic>
            ? settings.arguments as Map<String, dynamic>
            : {};
        List<String> menuEntityIds = arguments['menuEntityIds'] ?? [];
        return MaterialPageRoute(
          builder: (_) => MenuItemScreen(
            menuEntityIds: menuEntityIds,
          ),
        );

      case AppRoutes.toCategoryScreen:
        final arguments = settings.arguments is Map<String, dynamic>
            ? settings.arguments as Map<String, dynamic>
            : {};
        List<String> menuCategoryIds = arguments['menuCategoryIds'] ?? [];
        return MaterialPageRoute(
          builder: (_) => MenuCategoryScreen(
            menuCategoryIds: menuCategoryIds,
          ),
        );
      
      case AppRoutes.toModifierRulesScreen:
        final arguments = settings.arguments is Map<String, dynamic>
            ? settings.arguments as Map<String, dynamic>
            : {};
        List<String> modifierGroupRules = arguments['modifierGroupRules'] ?? [];
        return MaterialPageRoute(
          builder: (_) => ModifierRulesScreen(
            modifierGroupRules: modifierGroupRules,
          ),
        );
      
      case AppRoutes.toMenuListScreen:
        return MaterialPageRoute(
          builder: (_) => const MenuListScreen(),
        );

      // case AppRoutes.toAddCategoryScreen:
      // final arguments = settings.arguments is Map<String, dynamic>
      //     ? settings.arguments as Map<String, dynamic>
      //     : {};
      // bool isMain = arguments['isMain'] ?? false;
      //   bool isSub = arguments['isSub'] ?? false;
      //   bool isEdit = arguments['isEdit'] ?? false;
      //   ProfindServiceCategory mainCategory =
      //       arguments['category'] ?? ProfindServiceCategory();
      //   ProfindServiceSubCategory subcategory =
      //       arguments['subcategory'] ?? ProfindServiceSubCategory();

      //   return MaterialPageRoute(
      //     builder: (_) => AddCategoryScreen(
      //       isMain: isMain,
      //       isSub: isSub,
      //       isEdit: isEdit,
      //       mainCategory: mainCategory,
      //       subCategory: subcategory,
      //     ),
      //   );

      default:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
    }
  }
}
