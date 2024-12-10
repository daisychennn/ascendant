import 'package:ascendant/models/user_model.dart';
import 'package:flutter/cupertino.dart';

// Class that connects details to the current logged in user's account
class AccountViewModel {
  late UserModel user;

  AccountViewModel(UserModel model) {
    user = model;
  }

  // Getter methods using user model to create usable methods
  NetworkImage get getImage => user.getPicture;
  String get getName => user.getName;
  int get getAge => user.getAge;
  String get getSunSign => user.getBigThree()[0];
  String get getMoonSign => user.getBigThree()[1];
  String get getRisingSign => user.getBigThree()[2];
  List<String> get getPrompt1 => user.getPrompts()[0];
  List<String> get getPrompt2 => user.getPrompts()[1];
  List<String> get getPrompt3 => user.getPrompts()[2];

  // Methods to modify existing user data that is mutable
  // Setters for prompts
  void setPrompt1(String q, String a) {
    user.setPrompts(1, q, a);
  }

  void setPrompt2(String q, String a) {
    user.setPrompts(2, q, a);
  }

  void setPrompt3(String q, String a) {
    user.setPrompts(3, q, a);
  }
}
