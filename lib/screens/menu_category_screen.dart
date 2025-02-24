import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_order_app/common_widgets/common_list_view.dart';
import 'package:food_order_app/common_widgets/main_container.dart';
import 'package:food_order_app/config/app_colors.dart';
import 'package:food_order_app/config/app_routes.dart';
import 'package:food_order_app/config/assets.dart';
import 'package:food_order_app/data/models/category/food_category.dart';
import 'package:food_order_app/services/food_api_service.dart';
import 'package:food_order_app/utils/navigation_util.dart';
import 'package:food_order_app/utils/print_log.dart';
import 'package:food_order_app/utils/screen_util.dart';

class MenuCategoryScreen extends StatefulWidget {
  const MenuCategoryScreen({
    super.key,
    required this.menuCategoryIds,
  });
  final List<String> menuCategoryIds;

  @override
  State<MenuCategoryScreen> createState() => _MenuCategoryScreenState();
}

class _MenuCategoryScreenState extends State<MenuCategoryScreen> {
  List<FoodCategory> foodCategories = [];

  @override
  void initState() {
    super.initState();
    foodCategories = FoodApiService().getCategories(
      menuCategoryIds: widget.menuCategoryIds,
    );
  }

  @override
  Widget build(BuildContext context) {
    return CommonListViewContainer(
      isAvoidBottomSheet: true,
      isBackAvailable: true,
      title: "Select Category",
      listViewBuilder: foodCategories.isEmpty
          ? SizedBox(
              height: getDeviceHeight(context) * 0.2,
              child: const Center(
                child: Text("No Records Found for Food Categories"),
              ),
            )
          : ListView.builder(
              itemCount: foodCategories.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    List<String> menuEntityIds = [];
                    foodCategories[index].menuEntities.forEach(
                      (element) {
                        menuEntityIds.add(element.id);
                      },
                    );
                    pushScreen(
                      context,
                      AppRoutes.toMainScreen,
                      arguments: {
                        "menuEntityIds": menuEntityIds,
                      },
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                      bottom: 20.0,
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
                            foodCategories[index].title['en'].toString(),
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
