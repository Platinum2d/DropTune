import 'package:droptune/misc/get_it_reference.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionsHub{
  Future<PermissionStatus> getStoragePermissionStatus() async {
    return PermissionHandler().checkPermissionStatus(PermissionGroup.storage);
  }

  Future<Map<PermissionGroup, PermissionStatus>> requestStoragePermission() async {
    return PermissionHandler().requestPermissions([PermissionGroup.storage]);
  }

  static void showStoragePermissonDialog(BuildContext context){
    PermissionsHub hub = GetItReference.getIt.get<PermissionsHub>();

    hub.getStoragePermissionStatus().then((status){
      if (status != PermissionStatus.granted) {
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
    });
  }
}