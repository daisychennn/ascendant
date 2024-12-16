import 'package:flutter/material.dart';


class LoginModel with ChangeNotifier{
  final String username;
  final String password;

  LoginModel({required this.username, required this.password});
}