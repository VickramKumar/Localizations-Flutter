// ignore_for_file: prefer_typing_uninitialized_variables
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:localization/screens/loading_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:localization/notifications/my_notifications.dart';

class LoginScreenProvider extends ChangeNotifier {
  bool loading = false;

  bool obscureText = true;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  clearControllers() {
    emailController.clear();
    passwordController.clear();
  }

  void login(context) async {
    if (!emailController.text.contains('@gmail.com') &&
        passwordController.text.isEmpty) {
      MyNotifications.flushbar(
        context: context,
        message: AppLocalizations.of(context)!
            .the_email_should_contain_gmail_and_password_should_not_empty,
      );
    } else if (!emailController.text.contains('@gmail.com')) {
      MyNotifications.flushbar(
        context: context,
        message: AppLocalizations.of(context)!.the_email_should_contain_gmail,
      );
    } else if (passwordController.text.isEmpty) {
      MyNotifications.flushbar(
        context: context,
        message: AppLocalizations.of(context)!.the_password_should_not_empty,
      );
    } else {
      loading = true;
      notifyListeners();

      Timer.periodic(
        const Duration(seconds: 5),
        (timer) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const LoadingScreen(),
            ),
          );

          MyNotifications.flushbar(
            context: context,
            message:
                AppLocalizations.of(context)!.you_have_logged_in_succesfuly,
            icon: Icons.emoji_emotions,
          );

          clearControllers();

          loading = false;
          notifyListeners();

          timer.cancel();
        },
      );
    }
  }
}
