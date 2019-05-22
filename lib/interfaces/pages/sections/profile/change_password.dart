import 'package:flutter/material.dart';

class ChangePasswordPage extends StatefulWidget {
  @override
  State createState() {
    return _ChangePasswordPageState();
  }
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _currentPassword;
  String _newPassword;
  String _confirmNewPassword;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 308,
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 25),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: TextFormField(
                validator: (String s) {},
                onSaved: (String s) {
                  _currentPassword = s;
                },
                obscureText: true,
                decoration: InputDecoration(hintText: "Current password"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: TextFormField(
                validator: (String s) {},
                onSaved: (String s) {
                  _newPassword = s;
                },
                obscureText: true,
                decoration: InputDecoration(hintText: "New password"),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: TextFormField(
                validator: (String s) {},
                onSaved: (String s) {
                  _confirmNewPassword = s;
                },
                obscureText: true,
                decoration: InputDecoration(hintText: "Confirm new password"),
              ),
            ),
            FlatButton(
                onPressed: () {
                  if (!_formKey.currentState.validate()) return;
                },
                child: Text("CONFIRM"))
          ],
        ),
      ),
    );
  }
}
