import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  String _email_or_user;
  String _password;
  bool _granted = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool dismissed = false;

  Widget _verticalSpace(double requiredSpace) {
    return SizedBox(
      height: requiredSpace,
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 150,
      child: FlatButton(
        color: Colors.white70,
        child: Text(
          "LOGIN",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          if (!_formKey.currentState.validate() || !_granted) return;
          Navigator.of(context)
              .popUntil(ModalRoute.withName('/access/access_bridge'));
          Navigator.of(context).pushReplacementNamed('/pages/main_page');
        },
      ),
    );
  }

  Widget _buildField(
      {String text,
      Function validator,
      Function onSaved,
      bool isPassword = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: TextFormField(
        validator: validator,
        onSaved: onSaved,
        decoration: InputDecoration(hintText: text),
        obscureText: isPassword,
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Center(
      child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "To have your playlist always with you",
                  style: TextStyle(color: Colors.black54),
                ),
                _verticalSpace(50),
                _buildField(
                    text: "Email or username",
                    validator: (String value) {},
                    onSaved: (String s) {
                      _email_or_user = s;
                    },
                    isPassword: true),
                _verticalSpace(20),
                _buildField(
                    text: "Password",
                    validator: (String value) {},
                    onSaved: (String s) {
                      _password = s;
                    },
                    isPassword: true),
                _verticalSpace(20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: SwitchListTile(
                      title: Text("Accept terms and conditions"),
                      value: _granted,
                      onChanged: (bool value) {
                        setState(() {
                          _granted = value;
                        });
                      }),
                ),
                _verticalSpace(20),
                _buildLoginButton(context),
                _verticalSpace(20)
              ],
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        direction: DismissDirection.horizontal,
        onResize: () {
          if (dismissed) return;
          Navigator.of(context).pop();
          dismissed = true;
        },
        background:
            DecoratedBox(decoration: BoxDecoration(color: Colors.white)),
        key: Key('login'),
        child: Scaffold(
            body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/login_background.png"))),
          child: _buildForm(context),
        )));
  }
}
