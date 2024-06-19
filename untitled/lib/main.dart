import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'screen1.dart';
import 'screen2.dart';
import 'screen3.dart';
import 'screen4.dart';
import 'screen5.dart';
import 'app_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'מחוללי הניסים',
      home: HomePage(),
      localizationsDelegates: [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ''), // English
        Locale('he', ''), // Hebrew
      ],
      locale: Locale('he', ''), // Set default locale to Hebrew
      routes: {
        '/screen1': (context) => Screen1(),
        '/screen2': (context) => Screen2(),
        '/screen3': (context) => Screen3(),
        '/screen4': (context) => Screen4(),
        '/screen5': (context) => Screen5(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showLoginFields = false;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            AppLocalizations.of(context).translate('welcome'),
            style: TextStyle(
              color: Colors.black,
            ),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 50.0),
            Center(
              child: Text(
                'מחוללי הניסים',
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
              ),
            ),
            SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
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
                  onPressed: () {},
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFEEB902),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    padding: EdgeInsets.symmetric(
                        vertical: 15.0,
                        horizontal: 50.0),
                  ),
                  child: Text(
                    AppLocalizations.of(context).translate('login'),
                    style: TextStyle(fontSize: 20.0),
                  ),
                  onPressed: () {
                    setState(() {
                      _showLoginFields = !_showLoginFields;
                    });
                  },
                ),
              ],
            ),
            if (_showLoginFields)
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _usernameController,
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context).translate('username'),
                        labelStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
                        border: OutlineInputBorder(),
                        alignLabelWithHint: true,
                      ),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        labelText: AppLocalizations.of(context).translate('password'),
                        labelStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
                        border: OutlineInputBorder(),
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
                            horizontal: 50.0),
                      ),
                      child: Text(
                        AppLocalizations.of(context).translate('login'),
                        style: TextStyle(fontSize: 20.0),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MainMenu()),
                        );
                      },
                    ),
                  ],
                ),
              ),
            Expanded(child: SizedBox()),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'אודות | תנאי שימוש | פרטיות | צור קשר\nMiracleMakers.com LTD © 2023',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.0),
              ),
            ),
            SizedBox(height: 10.0),
          ],
        ),
      ),
    );
  }
}

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).translate('main_menu'),
          textAlign: TextAlign.right,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_forward),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          children: <Widget>[
            _buildMenuItem(
              context,
              icon: Icons.screen_share,
              label: AppLocalizations.of(context).translate('go_to_screen1'),
              route: '/screen1',
            ),
            _buildMenuItem(
              context,
              icon: Icons.screen_lock_landscape,
              label: AppLocalizations.of(context).translate('go_to_screen2'),
              route: '/screen2',
            ),
            _buildMenuItem(
              context,
              icon: Icons.screen_lock_landscape,
              label: AppLocalizations.of(context).translate('go_to_screen3'),
              route: '/screen3',
            ),
            _buildMenuItem(
              context,
              icon: Icons.screen_lock_landscape,
              label: AppLocalizations.of(context).translate('go_to_screen4'),
              route: '/screen4',
            ),
            _buildMenuItem(
              context,
              icon: Icons.screen_lock_landscape,
              label: AppLocalizations.of(context).translate('go_to_screen5'),
              route: '/screen5',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, {required IconData icon, required String label, required String route}) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4.0,
              offset: Offset(2.0, 2.0),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              size: 50.0,
              color: Colors.black,
            ),
            SizedBox(height: 10.0),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
