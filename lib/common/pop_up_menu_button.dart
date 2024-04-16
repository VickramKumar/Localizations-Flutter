import 'package:flutter/material.dart';
import 'package:localization/provider/home_screen_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

popupMenuButton(context) {
  HomeScreenProvider provider = Provider.of<HomeScreenProvider>(context);
  return PopupMenuButton(
    elevation: 0,
    iconSize: 17.sp,
    color: Colors.black,
    padding: EdgeInsets.zero,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.zero,
    ),
    iconColor: Colors.white,
    popUpAnimationStyle: AnimationStyle.noAnimation,
    itemBuilder: (index) {
      return provider.languagesList.map<PopupMenuEntry<String>>(
        (item) {
          return PopupMenuItem(
            value: item['language_code'],
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            onTap: () async {
              provider.changeLanguage(
                item['language'],
                item['flag'],
                item['language_code'],
              );
            },
            child: Row(
              children: [
                Text(
                  item['flag'],
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 3.w),
                Text(
                  item['language'],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          );
        },
      ).toList();
    },
  );
}
