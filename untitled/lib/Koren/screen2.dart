import 'package:flutter/material.dart';
import 'app_localizations.dart';

class SupporterSignupScreen extends StatefulWidget {
  @override
  _SupporterSignupScreenState createState() => _SupporterSignupScreenState();
}

class _SupporterSignupScreenState extends State<SupporterSignupScreen> {
  final TextEditingController _supporterNameController = TextEditingController();
  final TextEditingController _supporterEmailController = TextEditingController();
  final TextEditingController _supporterRelationController = TextEditingController();
  final TextEditingController _supporterPhoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            AppLocalizations.of(context).translate('supporter_signup'),
            style: TextStyle(
              color: Colors.black,
            ),
            textDirection: TextDirection.rtl,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF2E294E),
              Color(0xFF3E8E9E),
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(height: 50.0),
                  Center(
                    child: Text(
                      AppLocalizations.of(context).translate('supporter_signup'),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            offset: Offset(2.0, 2.0),
                            blurRadius: 3.0,
                            color: Colors.black,
                          ),
                        ],
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  SizedBox(height: 30.0),
                  TextField(
                    controller: _supporterNameController,
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context).translate('supporter_name'),
                      labelStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.7),
                      alignLabelWithHint: true,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: _supporterEmailController,
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context).translate('supporter_email'),
                      labelStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.7),
                      alignLabelWithHint: true,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: _supporterPhoneController,
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context).translate('supporter_phone'),
                      labelStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.7),
                      alignLabelWithHint: true,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: _supporterRelationController,
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context).translate('supporter_relation'),
                      labelStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.7),
                      alignLabelWithHint: true,
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFEEB902),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 15.0,
                        horizontal: 50.0,
                      ),
                    ),
                    child: Text(
                      AppLocalizations.of(context).translate('signup'),
                      style: TextStyle(fontSize: 20.0),
                    ),
                    onPressed: () {
                      // לטפל בלוגיקת הרשמה כאן
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
