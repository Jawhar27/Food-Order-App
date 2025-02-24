import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_order_app/common_widgets/common_button.dart';
import 'package:food_order_app/common_widgets/cover_image_container.dart';
import 'package:food_order_app/config/app_colors.dart';
import 'package:food_order_app/config/app_routes.dart';
import 'package:food_order_app/config/assets.dart';
import 'package:food_order_app/common_widgets/main_container.dart';
import 'package:food_order_app/data/models/food_item/food_item.dart';
import 'package:food_order_app/data/models/food_item/price_info.dart';
import 'package:food_order_app/data/models/menu/food_menu.dart';
import 'package:food_order_app/providers/food_data_provider.dart';
import 'package:food_order_app/services/food_api_service.dart';
import 'package:food_order_app/utils/navigation_util.dart';
import 'package:food_order_app/utils/print_log.dart';
import 'package:food_order_app/utils/screen_util.dart';
import 'package:provider/provider.dart';

class MenuItemScreen extends StatefulWidget {
  const MenuItemScreen({
    super.key,
    required this.menuEntityIds,
  });
  final List<String> menuEntityIds;

  @override
  State<MenuItemScreen> createState() => _MenuItemScreenState();
}

class _MenuItemScreenState extends State<MenuItemScreen> {
  bool selectedMenuisLunch = true;

  int _selectedIndex = 0;

  List<String> _tabTitles = ['Basic', 'Sandwiches', 'Burgers', 'Pizzas'];

  bool removeFilter = false;

  List<FoodItem> foodItems = [];

  @override
  void initState() {
    super.initState();

    foodItems = FoodApiService().getItems(
      menuEntityIds: widget.menuEntityIds,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MainContainer(
      isSafeAreaNeeded: true,
      customMargin: 0,
      child: Column(
        children: [
          const CoverImageContainer(
            isAvoidBottomSheet: true,
          ),
          const SizedBox(
            height: 30.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 10.0,
                ),
                child: SizedBox(
                  width: getDeviceWidth(context) * 0.06,
                  height: getDeviceHeight(context) * 0.05,
                  child: Center(
                    child: IconButton(
                        onPressed: () {
                          popScreen(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                        )),
                  ),
                ),
              ),
              Expanded(
                child: _horizontalTabView(),
              ),
            ],
          ),
          Expanded(
            child: _foodMenu(),
          ),
        ],
      ),
    );
  }

  Widget _horizontalTabView() {
    return Container(
      margin: const EdgeInsets.only(
        left: 20.0,
        top: 20.0,
      ),
      height: getDeviceHeight(context) * 0.05,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _tabTitles.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              if (_selectedIndex == index) {
                setState(() {
                  removeFilter = !removeFilter;
                });
              }
              setState(() {
                _selectedIndex = index;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(
                right: 8.0,
              ),
              width: getDeviceWidth(context) * 0.3,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.borderGrey,
                ),
                color: (_selectedIndex == index && !removeFilter)
                    ? AppColors.green
                    : AppColors.white,
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Center(
                child: Text(
                  _tabTitles[index],
                  style: TextStyle(
                    color: (_selectedIndex == index && !removeFilter)
                        ? Colors.white
                        : Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _foodMenu() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: foodItems.isEmpty
          ? SizedBox(
              height: getDeviceHeight(context) * 0.2,
              child: const Center(
                child: Text("No Records Found for Food Items"),
              ),
            )
          : ListView.builder(
              itemCount: foodItems.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    pushScreen(context, AppRoutes.toModifierRulesScreen,
                        arguments: {
                          'modifierGroupRules':
                              foodItems[index].modifierGroupRules.ids
                        });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(
                      top: 15.0,
                    ),
                    height: getDeviceHeight(context) * 0.15,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: getDeviceHeight(context) * 0.09,
                              width: getDeviceWidth(context) * 0.2,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(
                                    15.0,
                                  ),
                                  bottomRight: Radius.circular(
                                    15.0,
                                  ),
                                ),
                                child: Image.asset(
                                  AppResources.foodMenu,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(
                                  left: 15.0,
                                ),
                                child: SizedBox(
                                  width: getDeviceWidth(context) * 0.6,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            foodItems[0].title['en'].toString(),
                                            style: TextStyle(
                                              color: AppColors.black,
                                              fontSize: 17.sp,
                                            ),
                                          ),
                                          Text(
                                            foodItems[index]
                                                .description['en']
                                                .toString(),
                                            style: TextStyle(
                                              color: AppColors.subTitle,
                                              fontSize: 13.sp,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: getDeviceWidth(context) * 0.2,
                            ),
                            Text(
                              '\$ ${getPrice(foodItems[index].priceInfo) ?? 0}',
                              style: TextStyle(
                                color: AppColors.green,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Visibility(
                              visible:
                                  foodItems[index].metaData.isDealProduct ??
                                      false,
                              child: Container(
                                height: getDeviceHeight(context) * 0.04,
                                width: getDeviceWidth(context) * 0.4,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    20.0,
                                  ),
                                  color: AppColors.yellow,
                                ),
                                child: Center(
                                  child: Text(
                                    'Promotions Available',
                                    style: TextStyle(
                                      color: AppColors.black,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10.0),
                          width: getDeviceWidth(context),
                          height: 1,
                          color: AppColors.borderGrey,
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }

  int? getPrice(PriceInfo price) {
    final provider = Provider.of<FoodDataProvider>(context);
    if (provider.isDeliverySelected) {
      return price.deliveryPrice;
    } else if (provider.isDineIn) {
      return price.tablePrice;
    }
  }
}
