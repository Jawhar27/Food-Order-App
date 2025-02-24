import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_order_app/common_widgets/common_button.dart';
import 'package:food_order_app/config/app_colors.dart';
import 'package:food_order_app/config/assets.dart';
import 'package:food_order_app/providers/food_data_provider.dart';
import 'package:food_order_app/utils/navigation_util.dart';
import 'package:food_order_app/utils/print_log.dart';
import 'package:food_order_app/utils/screen_util.dart';
import 'package:provider/provider.dart';

class CoverImageContainer extends StatefulWidget {
  const CoverImageContainer({super.key, this.isAvoidBottomSheet=false,});

  final bool isAvoidBottomSheet;

  @override
  State<CoverImageContainer> createState() => _CoverImageContainerState();
}

class _CoverImageContainerState extends State<CoverImageContainer> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FoodDataProvider>(context);
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: getDeviceWidth(context),
              height: getDeviceHeight(context) * 0.18,
              child: Image.asset(
                AppResources.mainCover,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: -35,
              left: getDeviceWidth(context) * 0.2,
              child: Container(
                width: getDeviceWidth(context) * 0.6,
                height: getDeviceHeight(context) * 0.08,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  border: Border.all(
                    color: AppColors.borderGrey,
                  ),
                  borderRadius: BorderRadius.circular(
                    30.0,
                  ),
                ),
                child: Row(
                  children: [
                    _iconWithRightBorder(
                      icon: Icons.delivery_dining,
                      onTap: () {
                        provider.toggleDeliverySelected(true);
                        provider.toggleDineIn(false);
                        provider.togglePack(false);
                      },
                      isHighlighted: provider.isDeliverySelected,
                      context: context,
                    ),
                    _iconWithRightBorder(
                      icon: Icons.store,
                      onTap: () {
                        provider.toggleDeliverySelected(false);
                        provider.toggleDineIn(false);
                        provider.togglePack(true);
                      },
                      isHighlighted: provider.isPack,
                      context: context,
                    ),
                    Expanded(
                      child: _iconWithRightBorder(
                        icon: Icons.dinner_dining,
                        removeBorder: true,
                        onTap: () {
                          provider.toggleDeliverySelected(false);
                          provider.toggleDineIn(true);
                          provider.togglePack(false);
                        },
                        isHighlighted: provider.isDineIn,
                        context: context,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Visibility(
          visible: !widget.isAvoidBottomSheet,
          child: _btnWithSearch(provider))
      ],
    );
  }

  Widget _btnWithSearch(FoodDataProvider provider) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
        top: 60.0,
      ),
      child: SizedBox(
        height: getDeviceHeight(context) * 0.06,
        width: getDeviceWidth(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CommonButton(
                  cutomWidth: provider.selectedMenuisLunch
                      ? getDeviceWidth(context) * 0.4
                      : getDeviceWidth(context) * 0.5,
                  buttonText: provider.selectedMenuisLunch
                      ? "LUNCH MENU"
                      : "BREAKFASH MENU",
                  buttonColor: AppColors.greyButton,
                  isIconNeeded: true,
                  onTap: () {
                    _openModalBottomSheet(provider);
                  },
                ),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 35,
              ),
            )
          ],
        ),
      ),
    );
  }

  _openModalBottomSheet(FoodDataProvider provider) {
    bool isLunchSelected = provider.selectedMenuisLunch;
    bool isBreakfastSelected = !provider.selectedMenuisLunch;
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, modalSetState) {
            return Container(
              height: getDeviceHeight(context) * 0.4,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    20.0,
                  ),
                  topRight: Radius.circular(
                    20.0,
                  ),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                      top: 30.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Select Menu',
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              popScreen(context);
                            },
                            icon: const Icon(
                              Icons.close,
                            ))
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 10.0,
                    ),
                    color: AppColors.borderGrey,
                    height: 1.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 20.0,
                    ),
                    child: SizedBox(
                      height: getDeviceHeight(context) * 0.15,
                      child: Column(
                        children: [
                          _menu(
                            menuTitle: "Lunch  10am - 5 pm",
                            isSelected: isLunchSelected,
                            onTap: () {
                              modalSetState(() {
                                isLunchSelected = true;
                                isBreakfastSelected = false;
                              });
                            },
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          _menu(
                            menuTitle: "Breakfast  8am - 2 pm",
                            onTap: () {
                              modalSetState(() {
                                isBreakfastSelected = true;
                                isLunchSelected = false;
                              });
                            },
                            isSelected: isBreakfastSelected,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  CommonButton(
                    buttonColor: AppColors.green,
                    buttonText: "Done",
                    borderRadius: 20,
                    buttonTextStyle: TextStyle(
                      color: AppColors.white,
                      fontSize: 15.sp,
                    ),
                    onTap: () {
                      provider.toggleSelectedMenuIsLunch(isLunchSelected);
                      popScreen(context);
                    },
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _menu({
    required String menuTitle,
    required bool isSelected,
    void Function()? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
        ),
        width: getDeviceWidth(context),
        height: getDeviceHeight(context) * 0.06,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              12.0,
            ),
            border: Border.all(
              color: AppColors.greyButton,
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              menuTitle,
              style: TextStyle(fontSize: 14.sp),
            ),
            CircleAvatar(
              radius: 12,
              backgroundColor:
                  isSelected ? AppColors.green : AppColors.greyButton,
              child: const CircleAvatar(
                radius: 5,
                backgroundColor: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _iconWithRightBorder({
    required IconData icon,
    bool removeBorder = false,
    void Function()? onTap,
    required bool isHighlighted,
    required BuildContext context,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: getDeviceHeight(context) * 0.18,
        width: getDeviceWidth(context) * 0.2,
        decoration: BoxDecoration(
          border: removeBorder
              ? null
              : const Border(
                  right: BorderSide(
                    width: 1,
                    color: AppColors.borderGrey,
                  ),
                ),
        ),
        child: Center(
          child: Icon(
            icon,
            size: isHighlighted ? 35 : 30,
            color: isHighlighted ? AppColors.green : AppColors.black,
          ),
        ),
      ),
    );
  }
}
