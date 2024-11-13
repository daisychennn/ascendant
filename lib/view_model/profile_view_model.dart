import 'package:ascendant/models/user_model.dart';

// Contains a map of users that can be grabbed via the model
class ProfileViewModel {
  static Map<String, UserModel> profileMap = {};

  // Adds profile mapping to profileMap object
  // Parameters: String email and UserModel object
  static void addProfileToMap(String email, UserModel user) {
    profileMap[email] = user;
  }

  // Returns a user model object based on email key
  // Parameters: String email, Returned: UserModel or null
  static UserModel? fetchMatchDetails(String email) {
    return profileMap[email];
  }
}