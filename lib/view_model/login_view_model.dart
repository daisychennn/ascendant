import 'package:ascendant/models/login_model.dart';
import 'package:ascendant/models/user_model.dart';

import 'package:ascendant/view_model/profile_view_model.dart';
import 'package:ascendant/view_model/account_view_model.dart';

class LoginViewModel {

  // Creates a user model object based on mapping
  // Adds email and user model object to mapping in profile view model

  // Nhu - you may want to move this to login view/ create user view after created this is just my start for you!
  void addUserProfile(loginModel, userJson) {
    // userJson should be in form of Map<String, dynamic> with string inputs listed for each field below
    // JSON obj contains: picture -> File picture, name -> String name, age -> int age,
    //  sun -> String sun sign, moon -> String moon sign, rising -> String rising sign
    // prompt_one -> String question prompt, answer_one -> String prompt answer (same for two and three)
    UserModel userModel = UserModel.createUser(userJson);
    ProfileViewModel.addProfileToMap(loginModel.email, userModel);
    AccountViewModel(loginModel);
  }
}