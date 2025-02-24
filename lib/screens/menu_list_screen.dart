import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_order_app/common_widgets/common_list_view.dart';
import 'package:food_order_app/common_widgets/main_container.dart';
import 'package:food_order_app/config/app_colors.dart';
import 'package:food_order_app/config/app_routes.dart';
import 'package:food_order_app/config/assets.dart';
import 'package:food_order_app/data/models/menu/food_menu.dart';
import 'package:food_order_app/services/food_api_service.dart';
import 'package:food_order_app/utils/navigation_util.dart';
import 'package:food_order_app/utils/print_log.dart';
import 'package:food_order_app/utils/screen_util.dart';

class MenuListScreen extends StatefulWidget {
  const MenuListScreen({super.key});

  @override
  State<MenuListScreen> createState() => _MenuListScreenState();
}

class _MenuListScreenState extends State<MenuListScreen> {
  List<FoodMenu> foodMenus = [];

  @override
  void initState() {
    super.initState();
    foodMenus = FoodApiService().getMenu();
    
  }

  @override
  Widget build(BuildContext context) {
    return CommonListViewContainer(
      listViewBuilder: foodMenus.isEmpty
          ? SizedBox(
              height: getDeviceHeight(context) * 0.2,
              child: const Center(
                child: Text("No Records Found for Food Menus"),
              ),
            )
          : ListView.builder(
        itemCount: foodMenus.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              List<String> menuCategoryIds = [];
              foodMenus[index].menuCategoryIDs.forEach((element) {
                menuCategoryIds.add(element);
              },);
              
              pushScreen(
                context,
                AppRoutes.toCategoryScreen,
                arguments: {
                  'menuCategoryIds': menuCategoryIds,
                },
              );
            },
            child: Container(
              margin: const EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 10,
              ),
              height: getDeviceHeight(context) * 0.07,
              width: getDeviceWidth(context),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  12.0,
                ),
                border: Border.all(
                  color: AppColors.borderGrey,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 12.0,
                ),
                child: Row(
                  children: [
                    Image.asset(
                      AppResources.foodMenu,
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      foodMenus[index].title['en'].toString(),
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
