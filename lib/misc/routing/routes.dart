import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'handlers.dart';

class Routes {
  static String root = "/";
  static String login = "/access/login";
  static String register = "/access/register";
  static String accessHub = "/access/access_hub";
  static String mainPage = "/pages/main_page";

  static void configureRoutes(Router router){
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
          print("ROUTE WAS NOT FOUND !!!");
        });

    router.define(root, handler: rootHandler);
    router.define(accessHub, handler: accessHubHandler);
    router.define(login, handler: loginHandler);
    router.define(register, handler: registerHandler);
    router.define(mainPage, handler: mainPageHandler);
  }
}