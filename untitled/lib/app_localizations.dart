import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    final instance = Localizations.of<AppLocalizations>(context, AppLocalizations);
    if (instance == null) {
      throw Exception('AppLocalizations instance is null');
    }
    return instance;
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'welcome': 'Welcome',
      'login': 'Log In',
      'signup': 'Sign Up',
      'username': 'Username',
      'password': 'Password',
      'main_menu': 'Main Menu',
      'go_to_screen1': 'Go to Screen 1',
      'go_to_screen2': 'Go to Screen 2',
    },
    'he': {
      'welcome': 'ברוך הבא',
      'login': 'התחבר',
      'signup': 'הרשמה',
      'username': 'שם משתמש',
      'password': 'סיסמה',
      'main_menu': 'התפריט הראשי',
      'go_to_screen1': 'לך למסך 1',
      'go_to_screen2': 'לך למסך 2',
    },
  };

  String translate(String key) {
    return _localizedValues[locale.languageCode]?[key] ?? 'Translation not found';
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'he'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
