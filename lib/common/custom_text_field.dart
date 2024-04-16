// ignore_for_file: must_be_immutable
import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  String hintText;
  IconData icon;
  TextEditingController controller;

  int? maxLines;
  bool? obscureText;
  bool? readOnly;
  IconData? suffixIcon;
  Function()? onTap;
  Function()? suffixOnPressed;
  Function(String)? onChanged;

  CustomTextField({
    super.key,
    this.onTap,
    this.readOnly,
    this.maxLines,
    this.suffixIcon,
    this.obscureText,
    this.onChanged,
    this.suffixOnPressed,
    required this.icon,
    required this.hintText,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      readOnly: readOnly ?? false,
      obscureText: obscureText ?? false,
      maxLines: maxLines ?? 1,
      onTap: onTap ?? () {},
      onChanged: onChanged ?? (value) {},
      cursorColor: Colors.purple,
      style: TextStyle(
        color: Colors.black,
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(
          icon,
          color: Colors.black.withOpacity(0.7),
          size: 16.sp,
        ),
        hintStyle: TextStyle(
          color: Colors.grey,
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.purple),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
        suffixIcon: Visibility(
          visible: suffixIcon != null,
          child: IconButton(
            icon: Icon(
              suffixIcon,
              color: Colors.black,
              size: 16.sp,
            ),
            onPressed: suffixOnPressed ?? () {},
          ),
        ),
      ),
    );
  }
}
