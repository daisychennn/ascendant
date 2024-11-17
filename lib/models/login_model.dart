import 'package:flutter/material.dart';

class LoginModel with ChangeNotifier {
  final String username;
  final String password;
  final String fullName;
  final String email;
  final String phoneNumber;
  final String biography;
  final String sunSign;
  final String moonSign;
  final String risingSign;

  LoginModel({
    required this.username,
    required this.password,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.biography,
    required this.sunSign,
    required this.moonSign,
    required this.risingSign,
  });
}


// class LoginModel with ChangeNotifier {
//   String _email = '';
//   String _password = '';
//   bool _isLoading = false;
//   String? _errorMessage;

//   String get email => _email;
//   String get password => _password;
//   bool get isLoading => _isLoading;
//   String? get errorMessage => _errorMessage;

//   set email(String email) {
//     _email = email;
//     notifyListeners();
//   }

//   set password(String password) {
//     _password = password;
//     notifyListeners();
//   }
// }