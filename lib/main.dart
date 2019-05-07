import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'package:droptune/interfaces/splash.dart';
import 'package:droptune/interfaces/access/login.dart';
import 'package:droptune/interfaces/access/register.dart';
import 'package:droptune/interfaces/access/access_hub.dart';
import 'package:droptune/interfaces/pages/main_page.dart';

int getColor(String hex) {
  return int.parse(hex.substring(1, 7), radix: 16) + 0xFF000000;
}

void main() {
  //debugPaintSizeEnabled = true;
  runApp(DroptuneApp());
}

class DroptuneApp extends StatelessWidget {
  final double inputRadius = 50.0;
  final double buttonRadius = 20.0;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          backgroundColor: Colors.white,
          primaryColor: Color(getColor("#11d6f8")),
          brightness: Brightness.light,
          fontFamily: "Poppins",
          buttonColor: Color(getColor("#d9ffff")),
          appBarTheme:
              AppBarTheme(color: Color(getColor("#fcfcfc")), elevation: 0),
          buttonTheme: ButtonThemeData(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(buttonRadius))),
          inputDecorationTheme: InputDecorationTheme(
              isDense: true,
              isCollapsed: true,
              filled: true,
              fillColor: Color(getColor("#99f2fa")),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(inputRadius)))),
      home: SplashPage(),
      routes: {
        '/home': (BuildContext context) => SplashPage(),
        '/access/login': (BuildContext context) => LoginPage(),
        '/access/register': (BuildContext context) => RegisterPage(),
        '/access/access_bridge': (BuildContext context) => AccessHubPage(),
        '/pages/main_page': (BuildContext context) => MainPage()
      },
    );
  }
}
