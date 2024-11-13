import 'dart:io';

class user_model {
    File? picture; // Pictures only done through file upload
    String? name;
    int? age;
    List<List<String>> prompts = List.empty(); // Set of three prompts with question/answer list
    List<String> bigThree = List.empty(); // List of three astrological signs

    user_model.createUser(Map<String, dynamic> json) {
      // Setting objects present in all profiles
      picture = json['picture'];
      name = json['name'];
      age = json['age'];
      bigThree[0] = json['sun'];
      bigThree[1] = json['moon'];
      bigThree[2] = json['rising'];

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
}