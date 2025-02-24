import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_order_app/common_widgets/common_list_view.dart';
import 'package:food_order_app/common_widgets/main_container.dart';
import 'package:food_order_app/config/app_colors.dart';
import 'package:food_order_app/data/models/food_item/food_item.dart';
import 'package:food_order_app/data/models/food_item/price_info.dart';
import 'package:food_order_app/data/models/modifier_group/modifier_group.dart';
import 'package:food_order_app/main.dart';
import 'package:food_order_app/providers/food_data_provider.dart';
import 'package:food_order_app/services/food_api_service.dart';
import 'package:food_order_app/utils/print_log.dart';
import 'package:food_order_app/utils/screen_util.dart';
import 'package:provider/provider.dart';

class ModifierRulesScreen extends StatefulWidget {
  const ModifierRulesScreen({
    super.key,
    required this.modifierGroupRules,
  });

  final List<String> modifierGroupRules;

  @override
  State<ModifierRulesScreen> createState() => _ModifierRulesScreenState();
}

class _ModifierRulesScreenState extends State<ModifierRulesScreen> {
  List<ModifierGroup> modifierGroups = [];
  List<FoodItem> foodItems = [];
  List<int> foodItemQuantities = [];

  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    widget.modifierGroupRules.forEach(
      (element) {
        printLogs(element);
      },
    );
    _loadModifierGroups();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _loadModifierGroups() {
    modifierGroups = FoodApiService()
        .getModifierGroups(modifierGroupIds: widget.modifierGroupRules);

    if (modifierGroups.isNotEmpty) {
      List<String> menuItemsIds = [];
      modifierGroups.forEach((modifierGroup) {
        modifierGroup.modifierOptions.forEach((option) {
          menuItemsIds.add(option.id!);
        });
      });

      foodItems = FoodApiService().getItems(menuEntityIds: menuItemsIds);
      foodItemQuantities = List.filled(foodItems.length, 0);
    }
    setState(() {});
  }

  double totalPrice = 0.0;

  void _totalPrice(double price, bool isAdd) {
    printLogs(price);
    double newPrice = isAdd ? totalPrice + price : totalPrice - price;
    printLogs(newPrice);
    setState(() {
      totalPrice = newPrice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CommonListViewContainer(
        isAvoidBottomSheet: true,
        isBackAvailable: true,
        title: "Select Modifier",
        listViewBuilder: modifierGroups.isEmpty
            ? const SizedBox(
                child: Center(
                  child: Text("No Records Found for Modifiers"),
                ),
              )
            : ListView.builder(
                itemCount: modifierGroups.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: getDeviceHeight(context) * 0.4,
                    margin: const EdgeInsets.only(
                      top: 20.0,
                      left: 20.0,
                      right: 20.0,
                    ),
                    padding: const EdgeInsets.all(
                      10.0,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.borderGrey),
                      borderRadius: BorderRadius.circular(
                        12.0,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          modifierGroups[index].title['en'].toString(),
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          modifierGroups[index].description['en'].toString(),
                          style: TextStyle(
                            fontSize: 12.sp,
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(bottom: 10.0, right: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Modifier Options',
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                totalPrice.toString(),
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                            child: foodItems.isEmpty
                                ? const Center(
                                    child: Text("No Modifer Option Found!"),
                                  )
                                :  ListView.builder(
                                      controller: _scrollController,
                                      itemCount: foodItems.length,
                                      itemBuilder: (context, foodIndex) {
                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            
                                            Text(
                                              foodItems[foodIndex]
                                                  .title['en']
                                                  .toString(),
                                            ),
                                            Row(
                                              children: [
                                                IconButton(
                                                  color: AppColors.green,
                                                  onPressed: () {
                                                    if (foodItemQuantities[
                                                            foodIndex] >
                                                        0) {
                                                      if (totalPrice > 0) {
                                                        _totalPrice(
                                                          getPrice(foodItems[
                                                                  foodIndex]
                                                              .priceInfo),
                                                          false,
                                                        );
                                                      }
                                                      setState(() {
                                                        foodItemQuantities[
                                                            foodIndex]--;
                                                      });
                                                    }
                                                  },
                                                  icon:
                                                      const Icon(Icons.remove),
                                                ),
                                                Text(
                                                  foodItemQuantities[foodIndex]
                                                      .toString(),
                                                      style: TextStyle(
                                                        fontSize: 14.sp,
                                                        color: AppColors.green,
                                                        fontWeight: FontWeight.w600,
                                                      ),
                                                ),
                                                IconButton(
                                                  color: AppColors.green,
                                                  onPressed: () {
                                                    _totalPrice(
                                                      getPrice(
                                                          foodItems[foodIndex]
                                                              .priceInfo),
                                                      true,
                                                    );
                                                    setState(() {
                                                      foodItemQuantities[
                                                          foodIndex]++;
                                                    });
                                                  },
                                                  icon: const Icon(
                                                    Icons.add,
                                                  ),
                                                )
                                              ],
                                            )
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                      ],
                    ),
                  );
                },
              ));
  }

  double getPrice(PriceInfo price) {
    final provider = Provider.of<FoodDataProvider>(
      context,
      listen: false,
    );
    if (provider.isDeliverySelected) {
      return price.deliveryPrice.toDouble();
    } else if (provider.isDineIn) {
      return price.tablePrice.toDouble();
    }
    return price.pickupPrice.toDouble();
  }
}
