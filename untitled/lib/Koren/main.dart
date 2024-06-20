import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'app_localizations.dart';
import 'screen2.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'הרשמה - תומך',
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ''), // English
        Locale('he', ''), // Hebrew
      ],
      locale: Locale('he', ''), // Set default locale to Hebrew
      home: SupporterSignupScreen(),
    );
  }
}
