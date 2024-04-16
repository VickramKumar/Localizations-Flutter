// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:localization/common/my_button.dart';
import 'package:localization/screens/login_screen.dart';
import 'package:localization/common/custom_text_field.dart';
import 'package:localization/common/pop_up_menu_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:localization/provider/sign_up_screen_provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpScreenProvider provider =
        Provider.of<SignUpScreenProvider>(context, listen: false);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.localization,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          popupMenuButton(context),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)!.personal_information,
              style: TextStyle(
                color: Colors.purple,
                fontSize: 19.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 5.h),
            CustomTextField(
              icon: Icons.edit,
              hintText: AppLocalizations.of(context)!.name,
              controller: provider.nameController,
            ),
            SizedBox(height: 2.h),
            CustomTextField(
              icon: Icons.email,
              hintText: AppLocalizations.of(context)!.email,
              controller: provider.emailController,
            ),
            SizedBox(height: 2.h),
            StatefulBuilder(
              builder: (context, setState) {
                return CustomTextField(
                  icon: Icons.lock,
                  obscureText: provider.obscureText,
                  hintText: AppLocalizations.of(context)!.password,
                  controller: provider.passwordController,
                  suffixIcon: provider.obscureText
                      ? Icons.visibility
                      : Icons.visibility_off,
                  suffixOnPressed: () {
                    provider.obscureText = !provider.obscureText;
                    setState(() {});
                  },
                );
              },
            ),
            SizedBox(height: 3.h),
            Selector<SignUpScreenProvider, bool>(
              selector: (context, selector) => selector.loading,
              builder: (context, value, child) {
                return MyButton(
                  loading: value,
                  text: AppLocalizations.of(context)!.sign_up,
                  onTap: () {
                    provider.signUp(context);
                  },
                );
              },
            ),
            SizedBox(height: 3.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Expanded(
                  child: Divider(
                    color: Colors.purple,
                  ),
                ),
                SizedBox(width: 1.w),
                Text(
                  AppLocalizations.of(context)!.or,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(width: 1.w),
                const Expanded(
                  child: Divider(
                    color: Colors.purple,
                  ),
                ),
              ],
            ),
            SizedBox(height: 3.h),
            Container(
              height: 6.8.h,
              width: 100.w,
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.circular(3.sp),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Transform.scale(
                      scale: 0.7,
                      child: Image.asset('assets/icons/google.png'),
                    ),
                    Text(
                      AppLocalizations.of(context)!.sign_up_with_google,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context)!.already_have_an_account,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  child: Text(
                    AppLocalizations.of(context)!.login,
                    style: TextStyle(
                      color: Colors.purple,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
