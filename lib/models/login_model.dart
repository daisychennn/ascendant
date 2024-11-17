import 'package:flutter/material.dart';


class LoginModel with ChangeNotifier{
  final String username;
  final String password;

  LoginModel({required this.username, required this.password});
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