import 'dart:convert';
import 'package:ascendant/models/login_model.dart';
import 'package:ascendant/view_model/user_service.dart'; 

class LoginViewModel {
  final UserService userService = UserService(); // saving user data

  // validate login credentials
  String? validateLogin(String username, String password) {
    if (username.isEmpty) return 'Username cannot be empty';
    if (password.isEmpty) return 'Password cannot be empty';
    return null; // No errors
  }

  Future<bool> login(String username, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    if (username == 'hi' && password == 'test') {
      return true; 
    }
    return false; 
  }

  // Create a LoginModel instance for profile creation
  LoginModel createLoginModel({
    required String username,
    required String password,
    required String fullName,
    required String email,
    required String phoneNumber,
    required String biography,
    required String sunSign,
    required String moonSign,
    required String risingSign,
  }) {
    return LoginModel(
      username: username,
      password: password,
      fullName: fullName,
      email: email,
      phoneNumber: phoneNumber,
      biography: biography,
      sunSign: sunSign,
      moonSign: moonSign,
      risingSign: risingSign,
    );
  }

  // Save the user's profile to users.json
  Future<void> saveUserProfile(LoginModel user) async {
    await userService.saveUserData(user);
  }
}
