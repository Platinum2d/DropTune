import 'package:flutter/material.dart';

class AccessBridgePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                  padding: EdgeInsets.only(bottom: 15),
                  child: SizedBox(
                    width: 270,
                    height: 40,
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
                        Navigator.of(context).pushNamed('/access/register');
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: 270,
                  height: 40,
                  child: FlatButton(
                    color: Colors.white70,
                    child: Text(
                      "SIGN IN",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 15),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/access/login');
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
