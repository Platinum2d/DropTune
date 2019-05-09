import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'package:droptune/interfaces/splash.dart';
import 'package:droptune/interfaces/access/login.dart';
import 'package:droptune/interfaces/access/register.dart';
import 'package:droptune/interfaces/access/access_hub.dart';
import 'package:droptune/interfaces/pages/main_page.dart';

void main() {
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
          primaryColor: Color(0xff11d6f8),
          brightness: Brightness.light,
          fontFamily: "Poppins",
          buttonColor: Color(0xffd9ffff),
          appBarTheme:
              AppBarTheme(color: Color(0xfffcfcfc), elevation: 0),
          buttonTheme: ButtonThemeData(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(buttonRadius))),
          inputDecorationTheme: InputDecorationTheme(
              isDense: true,
              isCollapsed: true,
              filled: true,
              fillColor: Color(0xff99f2fa),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(inputRadius)))),
      home: SplashPage(),
      routes: {
        '/home': (BuildContext context) => SplashPage(),
        '/access/login': (BuildContext context) => LoginPage(),
        '/access/register': (BuildContext context) => RegisterPage(),
        '/access/access_bridge': (BuildContext context) => AccessHubPage(),
        '/pages/main_page': (BuildContext context) => MainPage(),
      },
    );
  }
}
