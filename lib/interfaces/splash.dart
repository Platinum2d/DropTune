import 'package:droptune/misc/routing/routing.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  final bool _isLogged = false;

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

  void load(BuildContext context) async {
    await sleep();
    if (!_isLogged)
      Routing.goToAccessHub(context, clearStack: true);
  }

  Future sleep() {
    return new Future.delayed(Duration(seconds: 1));
  }
}
