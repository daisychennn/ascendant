import 'package:ascendant/models/user_model.dart';
import 'package:flutter/material.dart';
import 'dart:math';

// Contains a map of users that can be grabbed via the model
class ProfileViewModel {
  // Fake User Data auto populated
  UserModel prof1 = UserModel.createUser({
    "picture" : const NetworkImage('https://images.unsplash.com/photo-1723200166097-4eed8c141f03?q=80&w=987&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'), 
    "name" : "Natalie NotAName", "age" : 21,
    "sun" : "Taurus", "moon" : "Leo", "rising" : "Aries",
    "prompt_one" : "Dating me is like...", "answer_one" : "I'm not a real person",
    "prompt_two" : "Don't hate me if I...", "answer_two" : "am a fake profile",
    "prompt_three" : "I bet you can't...", "answer_three" : "find me! Still not real!"
  });

  UserModel prof2 = UserModel.createUser({
    "picture" :  const NetworkImage('https://images.unsplash.com/photo-1632324343640-86af9827dbeb?q=80&w=987&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'), 
    "name" : "Fiona FakePerson", "age" : 23,
    "sun" : "Gemini", "moon" : "Virgo", "rising" : "Libra",
    "prompt_one" : "If loving this is wrong, I don't want to be right", "answer_one" : "Procrastination :)",
    "prompt_two" : "First round is on me if", "answer_two" : "you can guess when I created this profile",
    "prompt_three" : "I'm convinced that", "answer_three" : "I should have started this earlier :("
  });

  UserModel prof3 = UserModel.createUser({
    "picture" : const NetworkImage('https://static.wikia.nocookie.net/friends/images/4/43/10joey.png/revision/latest?cb=20241104084824'), 
    "name" : "Joey Tribbiani", "age" : 22,
    "sun" : "Sagittarius", "moon" : "Gemini", "rising" : "Aquarius",
    "prompt_one" : "Let's debate this topic", "answer_one" : "Are Hot Cheetos the superior Cheeto?",
    "prompt_two" : "My therapist would say I...", "answer_two" : "can turn every situation into a potential sitcom episode.",
    "prompt_three" : "A Life Goal of Mine", "answer_three" : "Eat every chocolate chip cookie in NYC."
  });

  UserModel prof4 = UserModel.createUser({
    "picture" : const NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKgFb6XOEswNOxh6U53PKUZRCndCkI8KX7Mw&s'),
    "name" : "Chandler Bing", "age" : 20,
    "sun" : "Virgo", "moon" : "Pisces", "rising" : "Taurus",
    "prompt_one" : "This year, I really want to...", "answer_one" : "Learn how to make my Mac and Cheese taste like restaurant quality",
    "prompt_two" : "My greatest strength", "answer_two" : "Overthinking everything",
    "prompt_three" : "I want someone who...", "answer_three" : "Can call me on my BS."
  });

  UserModel prof5 = UserModel.createUser({
    "picture" : const NetworkImage('https://substackcdn.com/image/fetch/f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fef58e20b-85cd-40de-af22-51b4fad4b5e3_1455x1447.jpeg'),
    "name" : "Phoebe Buffay", "age" : 24,
    "sun" : "Cancer", "moon" : "Aries", "rising" : "Capricorn",
    "prompt_one" : "I go crazy for...", "answer_one" : "A guy who can put together furniture.",
    "prompt_two" : "The one thing you should know about me is...", "answer_two" : "Stevie Nicks is my number one Spotify artist EVERY year.",
    "prompt_three" : "The key to my heart is...", "answer_three" : "listening to Smelly Cat with me :)"
  });

  UserModel prof6 = UserModel.createUser({
    "picture" : const NetworkImage('https://www.byrdie.com/thmb/SrhN5obcwMYVJndVwfq9ojgOIRA=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/GettyImages-138427200-ba878ab98f624069983088eae57500af.jpg'),
    "name" : "Rachel Green", "age" : 19,
    "sun" : "Capricorn", "moon" : "Sagittarius", "rising" : "Sagittarius",
    "prompt_one" : "My Typical Sunday", "answer_one" : "Sleeping until noon and Doordash-ing",
    "prompt_two" : "My best travel story", "answer_two" : "I got married (and divorced) in Vegas",
    "prompt_three" : "Let's make sure we're on the same page about...", "answer_three" : "Ghosting. It's only for brides on the wedding day."
  });

  // Picture not working :(
  UserModel prof7 = UserModel.createUser({
    "picture" : const NetworkImage('https://i.insider.com/5c8809dc2730ca59ee05755e?width=700'),
    "name" : "Monica Geller", "age" : 26,
    "sun" : "Pisces", "moon" : "Aquarius", "rising" : "Pisces",
    "prompt_one" : "I recently discovered that...", "answer_one" : "Not everyone agrees that Tobey Maguire is the best Spiderman??",
    "prompt_two" : "The dorkiest thing about me is...", "answer_two" : "I can recite the rain scene from Pride & Prejudice by heart",
    "prompt_three" : "Don't hate me if I...", "answer_three" : "Douse everything I eat with blue cheese dressing."
  });

  UserModel prof8 = UserModel.createUser({
    "picture" : const NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwgQUhNpb4h4Q02Dg2Ws-Qy7y0WhJ02ryWxA&s'),
    "name" : "Ross Geller", "age" : 18,
    "sun" : "Scorpio", "moon" : "Cancer", "rising" : "Cancer",
    "prompt_one" : "I won't shut up about...", "answer_one" : "My personal ranking of every potato dish. Mashed comes 5th, by the way.",
    "prompt_two" : "Don't hate me if...", "answer_two" : "We get married and divorced quickly.",
    "prompt_three" : "I want someone who...", "answer_three" : "Understand what we were on A BREAK means"
  });

  UserModel prof9 = UserModel.createUser({
    "picture" : const NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZtLT0sTzHHXcuAvNeofhMBWUk0reCNrou1w&s'), 
    "name" : "Jessica Day", "age" : 28,
    "sun" : "Libra", "moon" : "Capricorn", "rising" : "Virgo",
    "prompt_one" : "First round is on me if...", "answer_one" : "You can correctly guess my Hogwarts house.",
    "prompt_two" : "My simple pleasures...", "answer_two" : "Stimulating but easy conversations over my favorite bottle of red.",
    "prompt_three" : "You should leave a comment if...", "answer_three" : "You love to experiment in the kitchen."
  });

  // Picture not working :(
  UserModel prof10 = UserModel.createUser({
    "picture" : const NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTl_1pC5mW3gUuhTQ94jlM_KJcrBtJh85o1Ww&s'),
    "name" : "Winston Schmidt", "age" : 25,
    "sun" : "Aries", "moon" : "Taurus", "rising" : "Scorpio",
    "prompt_one" : "I'll pick the topic if you start the conversation...", "answer_one" : "The worst holiday traditions.",
    "prompt_two" : "I get myself out of a funk by...", "answer_two" : "Organizing my sock drawer by color, fabric, and likelihood to disappear.",
    "prompt_three" : "Fact about me that surprises people", "answer_three" : "I've never had a fast food hamburger in my life."
  });

  UserModel prof11 = UserModel.createUser({
    "picture" : const NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhpKfs6shOHi5eTMZdU9Of7m3bOSYTzhZ-lA&s'),
    "name" : "Nick Miller", "age" : 27,
    "sun" : "Leo", "moon" : "Scorpio", "rising" : "Gemini",
    "prompt_one" : "We're the same type of weird if...", "answer_one" : "Canceled plans bring a smile to your face.",
    "prompt_two" : "My simple pleasures", "answer_two" : "Finding money in old jeans and pretending I won the lottery.",
    "prompt_three" : "First round is on me if...", "answer_three" : "You promise to lower your expectations."
  });

  UserModel prof12 = UserModel.createUser({
    "picture" : const NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTTasW8RScD48qYy7A1zCqJKenEZOb7ahxUJw&s'),
    "name" : "Winston Bishop", "age" : 29,
    "sun" : "Aquarius", "moon" : "Libra", "rising" : "Leo",
    "prompt_one" : "I recently discovered that", "answer_one" : "You can't use a pancake as a frisbee (Don't Ask?)",
    "prompt_two" : "You should not go out with me if...", "answer_two" : "You're a dog person. My cat already swiped left.",
    "prompt_three" : "The dorkiest thing about me is...", "answer_three" : "I have a playlist for different shower moods."
  });

  UserModel prof13 = UserModel.createUser({
    "picture" : const NetworkImage('https://static.wikia.nocookie.net/newgirl/images/d/db/Cece_Season_7.jpg/revision/latest?cb=20180119135423'),
    "name" : "Cece Parekh", "age" : 30,
    "sun" : "Taurus", "moon" : "Leo", "rising" : "Aries",
    "prompt_one" : "I'll brag about you to my friends if", "answer_one" : "You don't skip moisturizer.",
    "prompt_two" : "I'm looking for", "answer_two" : "A fellow romance-movies hater",
    "prompt_three" : "My self-care routine is", "answer_three" : "Cucumbers. Both to eat and put on my face."
  });

  // Map of currently existing users
  Map<String, UserModel> profileMap = {};
  // Map of user matches
  List<String> matches = List.empty(growable: true);
  // Email of user logged into app
  String currUser = '';
  // Getter for currUser
  String get getAccountUser => currUser;

  // Constructor for profile view model
  ProfileViewModel(String email) {
    currUser = email;

    // Generating fake data
    profileMap["prof1@fake.email"] = prof1;
    profileMap["prof2@fake.email"] = prof2;
    profileMap["prof3@fake.email"] = prof3;
    profileMap["prof4@fake.email"] = prof4;
    profileMap["prof5@fake.email"] = prof5;
    profileMap["prof6@fake.email"] = prof6;
    profileMap["prof7@fake.email"] = prof7;
    profileMap["prof8@fake.email"] = prof8;
    profileMap["prof9@fake.email"] = prof9;
    profileMap["prof10@fake.email"] = prof10;
    profileMap["prof11@fake.email"] = prof11;
    profileMap["prof12@fake.email"] = prof12;
  }

  // Adds profile mapping to profileMap object
  // Parameters: String email and UserModel object
  void addProfileToMap(String email, UserModel user) {
    profileMap[email] = user;
  }

  void addMatch(String email) {
    matches.add(email);
  }

  UserModel? nextProfile() {
    if (matches.length+1 >= profileMap.length) {
      return null;
    }

    String profileKey = '';
    bool nextProfileFound = false;
    List<int> checkedIndices = List.empty(growable: true);
    while (!nextProfileFound) {
      int index = Random().nextInt(profileMap.length);
      String nextEmail = profileMap.keys.elementAt(index);

      if (!matches.contains(nextEmail) && !isCurrUser(nextEmail)) {
        if (!checkedIndices.contains(index)) {
          nextProfileFound = true;
          profileKey = nextEmail;
        }
        else {
          checkedIndices.add(index);
        }
      }
    }

    return fetchMatchDetails(profileKey);
  }

  // Returns a user model object based on email key
  // Parameters: String email, Returned: UserModel or null
  UserModel? fetchMatchDetails(String email) {
    return profileMap[email];
  }

  String fetchMatchEmail(UserModel user) {
    return profileMap.keys.firstWhere(
      (i) => profileMap[i] == user
    );
  }

  // Checks if current user profile fetched is current account user
  bool isCurrUser(String email) {
    if (currUser == email) {
      return true;
    }
    return false;
  }
}