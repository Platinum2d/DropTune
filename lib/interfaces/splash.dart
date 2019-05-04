import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  bool _isLogged = false;

  @override
  Widget build(BuildContext context) {
    Widget built = Scaffold(
        body: Container(
      alignment: Alignment(0, 0),
      child: Image.asset(
        'assets/images/droptune_logo.png',
        height: 125,
        width: 125,
      ),
    ));

    load(context);
    
    return built;
  }

  void load(BuildContext context) async{
    await sleep();
    if (!_isLogged)
      Navigator.of(context).pushReplacementNamed('/access/access_bridge');
  }

  Future sleep() {
    return new Future.delayed(Duration(seconds: 1));
  }
}
