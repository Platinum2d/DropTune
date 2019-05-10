import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  State createState() {
    return _RegisterPageState();
  }
}

class _RegisterPageState extends State<RegisterPage> {
  String _username = "";
  String _email = "";
  String _password = "";
  String _confirmPassword = "";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool dismissed = false;

  Widget _verticalSpace(double requiredSpace) {
    return SizedBox(
      height: requiredSpace,
    );
  }

  Widget _buildRegisterButton() {
    return SizedBox(
      height: 40,
      width: 150,
      child: FlatButton(
        color: Colors.white70,
        child: Text(
          "REGISTER",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          if (!_formKey.currentState.validate()) return;
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

  Widget _buildForm() {
    return Center(
      child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text(
                  "Register",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "It's free, and it will be forever",
                  style: TextStyle(color: Colors.black54),
                ),
                _verticalSpace(20),
                _buildField(
                    text: "Email",
                    onSaved: (String s) {
                      _email = s;
                    },
                    validator: (String value) {}),
                _verticalSpace(10),
                _buildField(
                    text: "Username",
                    onSaved: (String s) {
                      _username = s;
                    }),
                _verticalSpace(40),
                _buildField(
                    text: "Password",
                    onSaved: (String s) {
                      _password = s;
                    },
                    validator: (String s) {},
                    isPassword: true),
                _verticalSpace(10),
                _buildField(
                    text: "Confirm password",
                    onSaved: (String s) {
                      _confirmPassword = s;
                    },
                    validator: (String s) {},
                    isPassword: true),
                _verticalSpace(30),
                _buildRegisterButton(),
                _verticalSpace(20)
              ],
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        background:
            DecoratedBox(decoration: BoxDecoration(color: Colors.white)),
        onResize: () {
          if (dismissed) return;
          Navigator.of(context).pop();
          dismissed = true;
        },
        direction: DismissDirection.horizontal,
        key: Key('register'),
        child: Scaffold(
            body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/login_background.png"))),
          child: _buildForm(),
        )));
  }
}
