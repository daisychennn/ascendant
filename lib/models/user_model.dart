import 'package:flutter/material.dart';

class UserModel {
    NetworkImage picture = const NetworkImage(''); // Pictures only done through file upload
    String name = '';
    int age = -1;
    List<List<String>> prompts = List.empty(growable: true); // Set of three prompts with question/answer list
    List<String> bigThree = List.empty(growable: true); // List of three astrological signs

    // Getter methods for select objects
    NetworkImage get getPicture => picture;
    String get getName => name;
    int get getAge => age;

    // Constructor for UserModel object
    UserModel.createUser(Map<String, dynamic> json) {
      // Setting objects present in all profiles
      picture = json['picture'];
      name = json['name'];
      age = json['age'];
      bigThree.add(json['sun']);
      bigThree.add(json['moon']);
      bigThree.add(json['rising']);

      // Checking for prompts (can have up to 3)
      if (json.containsKey('prompt_one')) {
        List<String> prompt = [json['prompt_one'], json['answer_one']];
        prompts.add(prompt);

        if (json.containsKey('prompt_two')) {
          List<String> promptTwo = [json['prompt_two'], json['answer_two']];
          prompts.add(promptTwo);

          if (json.containsKey('prompt_three')) {
            List<String> promptThree = [json['prompt_three'], json['answer_three']];
            prompts.add(promptThree);
          } 
        }
      }
    }

    // Getter method for prompts
    List<List<String>> getPrompts() {
      return prompts;
    }

    // Getter method for Big Three Sign list
    List<String> getBigThree() {
      return bigThree;
    }

    // Setter for prompts
    // Inputs: which prompt number is being set (1-3), a string question, a string answer
    void setPrompts(int promptNum, String q, String a) {
      prompts[promptNum-1][0] = q;
      prompts[promptNum-1][1] = a;
    }
}