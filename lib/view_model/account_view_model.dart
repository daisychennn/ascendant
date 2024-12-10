import 'package:ascendant/models/login_model.dart';
import 'package:ascendant/models/user_model.dart';

import 'package:ascendant/view_model/profile_view_model.dart';

// Class that connects details to the current logged in user's account
class AccountViewModel {
  LoginModel? login;
  UserModel? user;

  AccountViewModel(LoginModel loginModel) {
    login = loginModel;

    ProfileViewModel pvm = ProfileViewModel(loginModel.username);
    user = pvm.fetchMatchDetails(loginModel.username);
  }
}
