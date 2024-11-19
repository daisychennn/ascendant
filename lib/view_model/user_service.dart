import 'dart:convert';
import 'dart:io';
import 'package:flutter/services.dart'; // For accessing assets
import 'package:path_provider/path_provider.dart';

class UserService {
  // Check and copy users.json to a writable location if needed
  Future<void> _initializeUsersFile() async {
    final file = await _getLocalFile();

    // If the file doesn't exist in the writable location, copy it from assets
    if (!file.existsSync()) {
      final usersJson = await rootBundle.loadString('assets/users.json');
      await file.writeAsString(usersJson);
    }
  }

  // Save user data to users.json
  Future<void> saveUserData(Map<String, String> userProfile) async {
    await _initializeUsersFile(); // Ensure the file exists
    final file = await _getLocalFile();
    final userData = await _getUserData(); // Get existing data

    // Add the new user data to the list
    userData.add(userProfile);

    final jsonString = json.encode(userData);
    await file.writeAsString(jsonString);
  }

  // Read user data from users.json
  Future<List<Map<String, String>>> _getUserData() async {
    await _initializeUsersFile(); // Ensure the file exists
    final file = await _getLocalFile();
    final jsonString = await file.readAsString();
    final List<dynamic> jsonData = json.decode(jsonString);
    return jsonData.map((e) => Map<String, String>.from(e)).toList();
  }

  // Get the local file path for users.json
  Future<File> _getLocalFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/users.json');
  }
}
