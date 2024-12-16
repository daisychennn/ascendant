import 'package:ascendant/models/login_model.dart';
import 'package:ascendant/models/user_model.dart';
import 'package:ascendant/view_model/profile_view_model.dart';
import 'package:ascendant/view_model/account_view_model.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:convert'; 
import 'package:flutter/services.dart';  // This is required for rootBundle
import 'package:get/get.dart';
import 'package:ascendant/view/survey_view.dart';
import 'package:ascendant/view_model/user_service.dart';
import 'package:ascendant/view/create_profile_view.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginViewModel {

  // Method to validate login credentials
  String? validateLogin(String username, String password) {
    if (username.isEmpty) return 'Username cannot be empty';
    if (password.isEmpty) return 'Password cannot be empty';
    return null; // No errors
  }

  Future<void> launchSignWebsite() async {
    const url = 'https://www.astrosofa.com/horoscope/ascendant';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<bool> login(String username, String password) async {
    try {
      // Load the users.json file from assets
      final jsonString = await rootBundle.loadString('assets/users.json');

      // Decode the JSON data
      final List<dynamic> users = json.decode(jsonString);

      // Validate the username and password
      for (var user in users) {
        if (user['email'] == username && user['password'] == password) {
          return true; // Credentials match
        }
      }
      return false; // Credentials do not match
    } catch (e) {
      print('Error during login: $e');
      return false; // Return false in case of any errors
    }
  }

  // Create a LoginModel instance
  LoginModel createLoginModel(String username, String password) {
    return LoginModel(username: username, password: password);
  }
}