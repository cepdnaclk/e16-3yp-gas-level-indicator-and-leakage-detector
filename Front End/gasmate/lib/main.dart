import 'package:flutter/material.dart';
import 'package:gasmate/pages/home_page.dart';
import 'package:gasmate/pages/leakageWarning.dart';
import 'package:gasmate/pages/login_page.dart';
import 'package:gasmate/pages/welcome_page.dart';
import 'package:gasmate/shared_service.dart';

Widget _defaultHome = WelcomePage();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool _isLoggedIn = await SharedService.isLoggedIn();

  //check whether user is logged in or not
  if (_isLoggedIn) {
    _defaultHome = new HomePage();
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: Colors.white,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          elevation: 0,
          foregroundColor: Colors.white,
        ),
        accentColor: Colors.orange[700],
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 22.0, color: Colors.orange[700]),
          headline2: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w700,
            color: Colors.orange[700],
          ),
          bodyText1: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
      ),
      //home: LoginPage());
      home: _defaultHome,
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => new HomePage(),
        '/login': (BuildContext context) => new LoginPage(),
      },
    );
  }
}
