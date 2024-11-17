import 'package:ascendant/models/login_model.dart';
import 'package:ascendant/models/user_model.dart';
import 'package:ascendant/view_model/profile_view_model.dart';
import 'package:ascendant/view_model/account_view_model.dart';

class LoginViewModel {
  // Method to validate login credentials
  String? validateLogin(String username, String password) {
    if (username.isEmpty) return 'Username cannot be empty';
    if (password.isEmpty) return 'Password cannot be empty';
    return null; // No errors
  }

  // Method to handle login
  Future<bool> login(String username, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    if (username == 'testuser' && password == '123456') {
      return true; 
    }
    return false; 
  }

  // Create a LoginModel instance
  LoginModel createLoginModel(String username, String password) {
    return LoginModel(username: username, password: password);
  }
}


// class LoginViewModel {

//   // Creates a user model object based on mapping
//   // Adds email and user model object to mapping in profile view model

//   // Nhu - you may want to move this to login view/ create user view after created this is just my start for you!
//   void addUserProfile(loginModel, userJson) {
//     // userJson should be in form of Map<String, dynamic> with string inputs listed for each field below
//     // JSON obj contains: picture -> File picture, name -> String name, age -> int age,
//     //  sun -> String sun sign, moon -> String moon sign, rising -> String rising sign
//     // prompt_one -> String question prompt, answer_one -> String prompt answer (same for two and three)
//     UserModel userModel = UserModel.createUser(userJson);
//     ProfileViewModel.addProfileToMap(loginModel.email, userModel);
//     AccountViewModel(loginModel);
//   }
// }