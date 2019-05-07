import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  State createState() {
    return _ProfilePageState();
  }
}

class _ProfilePageState extends State<ProfilePage> {
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
                    print("tapped");
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
