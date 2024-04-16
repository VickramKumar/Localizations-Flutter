import 'package:flutter/material.dart';

class HomeScreenProvider extends ChangeNotifier {
  String flag = '🇺🇸';
  String languageCode = 'en';
  String language = 'English';

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  List<Map<String, dynamic>> languagesList = [
    {
      'flag': '🇵🇰',
      'language': 'Urdu',
      'language_code': 'ur',
    },
    {
      'flag': '🇮🇳',
      'language': 'Hindi',
      'language_code': 'hi',
    },
    {
      'flag': '🇺🇸',
      'language': 'English',
      'language_code': 'en',
    },
  ];

  changeLanguage(newLanguage, newFlag, newLanguageCode) {
    language = newLanguage;
    flag = newFlag;
    languageCode = newLanguageCode;
    notifyListeners();
  }
}
