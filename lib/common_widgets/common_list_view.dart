import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_order_app/common_widgets/cover_image_container.dart';
import 'package:food_order_app/common_widgets/main_container.dart';
import 'package:food_order_app/config/assets.dart';
import 'package:food_order_app/utils/navigation_util.dart';
import 'package:food_order_app/utils/screen_util.dart';

class CommonListViewContainer extends StatelessWidget {
  const CommonListViewContainer({
    super.key,
    required this.listViewBuilder,
    this.title = "Select Menu",
    this.isBackAvailable = false,
    this.isAvoidBottomSheet = false,
  });
  final Widget listViewBuilder;
  final String title;
  final bool isBackAvailable;
  final bool isAvoidBottomSheet;
  @override
  Widget build(BuildContext context) {
    return MainContainer(
      isSafeAreaNeeded: true,
      customMargin: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CoverImageContainer(
            isAvoidBottomSheet: isAvoidBottomSheet,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 10,
              top: isAvoidBottomSheet ? 40 : 20,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Visibility(
                      visible: isBackAvailable,
                      child: IconButton(
                        onPressed: () {
                          popScreen(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                        ),
                      ),
                    ),
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 20.sp,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),
          Expanded(
            child: listViewBuilder,
          )
        ],
      ),
    );
  }
}
