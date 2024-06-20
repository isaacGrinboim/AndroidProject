import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations) ?? AppLocalizations(Locale('he'));
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  Map<String, String> _localizedStrings = {
    'supporter_signup': 'הרשמה - תומך',
    'supporter_name': 'שם התומך',
    'supporter_email': 'דוא"ל התומך',
    'supporter_relation': 'יחס התומך (הורה של המשתמש, אח שלו, וכדומה)',
    'supporter_phone': 'מספר טלפון התומך',
    'signup': 'הרשמה',
  };

  String translate(String key) {
    return _localizedStrings[key] ?? key;
  }
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'he'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }
}
