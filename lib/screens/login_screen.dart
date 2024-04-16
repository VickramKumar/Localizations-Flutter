// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:localization/common/my_button.dart';
import 'package:localization/screens/sign_up_screen.dart';
import 'package:localization/common/custom_text_field.dart';
import 'package:localization/common/pop_up_menu_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:localization/provider/login_screen_provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginScreenProvider provider =
        Provider.of<LoginScreenProvider>(context, listen: false);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.purple,
        iconTheme: const IconThemeData(color: Colors.white),
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
            Selector<LoginScreenProvider, bool>(
              selector: (context, selector) => selector.loading,
              builder: (context, value, child) {
                return MyButton(
                  loading: provider.loading,
                  text: AppLocalizations.of(context)!.login,
                  onTap: () {
                    provider.login(context);
                  },
                );
              },
            ),
            SizedBox(height: 4.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context)!.do_not_have_an_account,
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
                        builder: (context) => const SignUpScreen(),
                      ),
                    );
                  },
                  child: Text(
                    AppLocalizations.of(context)!.sign_up,
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
