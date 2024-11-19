import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart'; 

class UserService {
  // Save user data to users.json
  Future<void> saveUserData(Map<String, String> userProfile) async {
    final file = await _getLocalFile();
    final userData = await _getUserData(); // Get existing data

    // Add the new user data to the list
    userData.add(userProfile);

    final jsonString = json.encode(userData);
    await file.writeAsString(jsonString);
  }

  Future<List<Map<String, String>>> _getUserData() async {
    final file = await _getLocalFile();
    if (!file.existsSync()) {
      return []; 
    }
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
