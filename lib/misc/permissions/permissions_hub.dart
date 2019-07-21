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
}