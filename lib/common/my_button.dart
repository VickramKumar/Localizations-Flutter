// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:localization/common/custom_loading_indicator.dart';
import 'package:sizer/sizer.dart';

class MyButton extends StatelessWidget {
  MyButton({
    super.key,
    this.color,
    this.textColor,
    this.margin,
    this.padding,
    this.height,
    this.width,
    this.progressIndicatorColor,
    this.loading = false,
    required this.text,
    required this.onTap,
  });

  Function()? onTap;
  double? height;
  double? width;
  bool? loading;
  String text;
  Color? color;
  Color? textColor;
  Color? progressIndicatorColor;
  EdgeInsetsGeometry? margin;
  EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 6.8.h,
      width: width ?? double.infinity,
      margin: margin ?? EdgeInsets.zero,
      padding: padding ?? EdgeInsets.zero,
      child: Material(
        color: color ?? Colors.purple,
        borderRadius: BorderRadius.circular(3.sp),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(3.sp),
          child: Center(
            child: loading == true
                ? Transform.scale(
                    scale: 1.8,
                    child: CustomLoadingIndicator(
                      color: progressIndicatorColor ?? Colors.white,
                    ),
                  )
                : Text(
                    text,
                    style: TextStyle(
                      color: textColor ?? Colors.white,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
