// ignore_for_file: must_be_immutable

import 'package:sizer/sizer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:localization/screens/rocket_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:localization/provider/home_screen_provider.dart';
import 'package:localization/provider/login_screen_provider.dart';
import 'package:localization/provider/sign_up_screen_provider.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SignUpScreenProvider()),
        ChangeNotifierProvider(create: (context) => HomeScreenProvider()),
        ChangeNotifierProvider(create: (context) => LoginScreenProvider()),
      ],
      child: Consumer<HomeScreenProvider>(
        builder: (context, provider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            locale: Locale(provider.languageCode),
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            theme: ThemeData(
              primaryColor: Colors.purple,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
            ),
            home: Sizer(
              builder: (context, orientation, device) {
                return const RocketScreen();
              },
            ),
          );
        },
      ),
    );
  }
}
