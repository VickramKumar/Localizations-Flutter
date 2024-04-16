import 'dart:async';
import 'package:flutter/material.dart';
import 'package:localization/screens/loading_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:localization/notifications/my_notifications.dart';

class SignUpScreenProvider extends ChangeNotifier {
  bool loading = false;

  bool obscureText = true;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  clearController() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
  }

  void signUp(context) {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      MyNotifications.flushbar(
        context: context,
        message: AppLocalizations.of(context)!.please_fill_all_the_fields,
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
                AppLocalizations.of(context)!.you_have_signed_up_succesfuly,
          );

          loading = false;
          notifyListeners();

          clearController();

          timer.cancel();
        },
      );
    }
  }
}
