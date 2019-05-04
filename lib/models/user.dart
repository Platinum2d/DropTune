import 'package:flutter/material.dart';

class User{

  User({this.id, @required this.username, @required this.email});

  final int id;
  final String username;
  final String email;
}