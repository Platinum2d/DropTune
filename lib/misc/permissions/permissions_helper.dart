import 'package:droptune/misc/get_it_reference.dart';
import 'package:droptune/misc/permissions/permissions_hub.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionsHelper{
  static void showStoragePermissionDialog(BuildContext context){
    PermissionsHub hub = GetItReference.getIt.get<PermissionsHub>();

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Permissions required"),
            content: Text(
                "Droptune requires to access the internal storage to work. Please grant the permission"),
            actions: <Widget>[FlatButton(onPressed: (){
              hub.requestStoragePermission().then((Map<PermissionGroup, PermissionStatus> statuses){
                if (statuses[PermissionGroup.storage] == PermissionStatus.granted) {
                  Navigator.pop(context);
                }
              });
            }, child: Text("Ok"))],
          );
        });
  }

}