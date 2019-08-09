import 'package:droptune/interfaces/access/access_hub.dart';
import 'package:droptune/interfaces/access/login.dart';
import 'package:droptune/interfaces/access/register.dart';
import 'package:droptune/interfaces/pages/main_page.dart';
import 'package:droptune/interfaces/pages/playing_page/playing_page.dart';
import 'package:droptune/interfaces/splash.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

var rootHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return SplashPage();
});

var accessHubHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return AccessHubPage();
});

var loginHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return LoginPage();
});

var registerHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return RegisterPage();
});

var mainPageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return Provider<String>(
    builder: (context) {
      return "io sono un'altra stringa";
    },
    child: MainPage(),
  );
});