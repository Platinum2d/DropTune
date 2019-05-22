import 'package:droptune/interfaces/pages/sections/profile/change_password.dart';
import 'package:flutter/material.dart';

import 'package:rounded_modal/rounded_modal.dart';

class ProfilePage extends StatelessWidget {
  void _showChangePassword(context) {
    showRoundedModalBottomSheet(
        radius: 15,
        context: context,
        builder: (BuildContext context) {
          return ChangePasswordPage();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey[300]))),
              alignment: Alignment(0, 0),
              child: Icon(
                Icons.person,
                size: 200,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Form(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      onEditingComplete: () {
                        print("complete!");
                      },
                      decoration: InputDecoration(
                        hintText: "Username",
                      ),
                      validator: (String s) {},
                      onSaved: (String s) {},
                    )
                  ],
                ),
              ),
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                  onTap: () {
                    _showChangePassword(context);
                  },
                  borderRadius: BorderRadius.circular(60),
                  child: Container(
                      height: 50,
                      alignment: Alignment(-0.90, 0),
                      child: Text(
                        "Change password",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ))),
            ),
          ],
        ),
      ),
    );
  }
}
