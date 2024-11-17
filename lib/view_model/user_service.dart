import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:ascendant/models/login_model.dart';

class UserService {
  // Method to save user data to the JSON file
  Future<void> saveUserData(LoginModel user) async {
    try {
      final file = await _getLocalFile();
      List<Map<String, dynamic>> users = await loadUsers();

      // Convert the LoginModel to a Map
      Map<String, dynamic> userMap = {
        'username': user.username,
        'password': user.password,
        'fullName': user.fullName,
        'email': user.email,
        'phoneNumber': user.phoneNumber,
        'biography': user.biography,
        'sunSign': user.sunSign,
        'moonSign': user.moonSign,
        'risingSign': user.risingSign,
      };

      // Add the new user to the list
      users.add(userMap);

      // Save the updated list of users to the JSON file
      String jsonString = jsonEncode(users);
      await file.writeAsString(jsonString);
    } catch (e) {
      print("Error saving user data: $e");
    }
  }

  // Load existing users from the JSON file
  Future<List<Map<String, dynamic>>> loadUsers() async {
    try {
      final file = await _getLocalFile();
      if (await file.exists()) {
        String jsonString = await file.readAsString();
        List<dynamic> jsonResponse = jsonDecode(jsonString);
        return jsonResponse.map((user) => user as Map<String, dynamic>).toList();
      }
      return [];
    } catch (e) {
      print("Error loading users: $e");
      return [];
    }
  }

  // Get the local file for storing users.json
  Future<File> _getLocalFile() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;
    return File('$path/users.json');
  }
}
