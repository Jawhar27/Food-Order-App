import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_order_app/config/app_colors.dart';
import 'package:food_order_app/utils/screen_util.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    super.key,
    this.cutomWidth,
    required this.buttonText,
    this.buttonTextStyle,
    this.customHeight,
    required this.onTap,
    this.buttonColor,
    this.isIconNeeded = false,
    this.borderRadius = 10.0,
  });

  final double? cutomWidth;
  final double? customHeight;
  final String buttonText;
  final TextStyle? buttonTextStyle;
  final void Function()? onTap;
  final Color? buttonColor;
  final bool isIconNeeded;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: cutomWidth ?? getDeviceWidth(context) * 0.8,
        height: customHeight ?? getDeviceHeight(context) * 0.06,
        decoration: BoxDecoration(
          color: buttonColor ?? Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(
            borderRadius,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              buttonText,
              style: buttonTextStyle ??
                  TextStyle(
                    color: AppColors.black,
                    fontSize: 14.sp,
                  ),
            ),
            Visibility(
              visible: isIconNeeded,
              child: const Padding(
                padding: const EdgeInsets.only(
                  left: 5.0,
                ),
                child: Icon(
                  Icons.arrow_drop_down,
                  color: AppColors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
