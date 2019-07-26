import 'package:droptune/misc/permissions/permissions_helper.dart';
import 'package:droptune/misc/permissions/permissions_hub.dart';
import 'package:droptune/misc/routing/routing.dart';
import 'package:flutter/material.dart';

class AccessHubPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    WidgetsBinding.instance.addPostFrameCallback((duration) {
      PermissionsHub hub = PermissionsHub();
      hub.requestStoragePermission();
    });

    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/login_background.png"))),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              "Welcome to Droptune!",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 25),
                  child: SizedBox(
                    width: 270,
                    height: 45,
                    child: FlatButton(
                      color: Colors.lightBlue,
                      child: Text(
                        "REGISTER FOR FREE",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      onPressed: () {
                        Routing.goToRegister(context, clearStack: false);
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 25),
                  child: SizedBox(
                    width: 270,
                    height: 45,
                    child: FlatButton(
                      color: Colors.white,
                      child: Text(
                        "SIGN IN",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 15),
                      ),
                      onPressed: () {
                        Routing.goToLogin(context, clearStack: false);
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: 270,
                  height: 45,
                  child: FlatButton(
                    color: Colors.white54,
                    child: Text(
                      "USE OFFLINE",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                          fontSize: 15),
                    ),
                    onPressed: () {
                      Routing.goToMainPage(context, clearStack: true);
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
