import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:ascendant/view_model/account_view_model.dart';
import 'package:ascendant/models/user_model.dart';

class AccountView extends StatefulWidget {
  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountView();
}

class _AccountView extends State<AccountView> {
  UserModel prof1 = UserModel.createUser({
    "picture" : const NetworkImage('https://images.unsplash.com/photo-1723200166097-4eed8c141f03?q=80&w=987&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'), 
    "name" : "Natalie NotAName", "age" : 21,
    "sun" : "Taurus", "moon" : "Leo", "rising" : "Aries",
    "prompt_one" : "Dating me is like...", "answer_one" : "I'm not a real person",
    "prompt_two" : "Don't hate me if I...", "answer_two" : "am a fake profile",
    "prompt_three" : "I bet you can't...", "answer_three" : "find me! Still not real!"
  });

  TextEditingController prompt1 = TextEditingController(text: '');
  bool isEnabledP1 = false;
  TextEditingController answer1 = TextEditingController(text: '');
  bool isEnabledA1 = false;

  TextEditingController prompt2 = TextEditingController(text: '');
  bool isEnabledP2 = false;
  TextEditingController answer2 = TextEditingController(text: '');
  bool isEnabledA2 = false;

  TextEditingController prompt3 = TextEditingController(text: '');
  bool isEnabledP3 = false;
  TextEditingController answer3 = TextEditingController(text: '');
  bool isEnabledA3 = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth * 0.75; // 80% of screen width

    AccountViewModel avm = AccountViewModel(prof1);
    prompt1.text = avm.getPrompt1[0];
    answer1.text = avm.getPrompt1[1];
    prompt2.text = avm.getPrompt2[0];
    answer2.text = avm.getPrompt2[1];
    prompt3.text = avm.getPrompt3[0];
    answer3.text = avm.getPrompt3[1];

    return Scaffold(
      backgroundColor: const Color.fromRGBO(235, 168, 248, 1.0),
      body: Center(
        // Creates a scrollable account setting page
        child: SingleChildScrollView(
          child: Column(
          children: [
            // Container for the image: contains network image and darker purple border
            Center(
              child:
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 20.0),
                  child: Container(
                      width: cardWidth,
                      height: 200,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.purpleAccent,
                          width: 5,
                        ),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: avm.getImage
                        )
                      )
                ),
              )
            ),

            // User information that can be edited - will need actual data
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.person, color: Colors.purple),
                Text(avm.getName),
            ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.cake, color: Colors.purple),
                Text('${avm.getAge}'),
            ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.sunny, color: Colors.yellowAccent),
                Text(avm.getSunSign),
            ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(CupertinoIcons.moon, color: Colors.yellowAccent),
                Text(avm.getMoonSign),
            ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.star, color: Colors.yellowAccent),
                Text(avm.getRisingSign),
            ],),

            // Editable User Information (prompts that appear in info)
            Center(
              child: Column(
              children: <Widget>[
                // Prompt 1
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Icon(Icons.question_mark_rounded),
                    ),
                    SizedBox(
                      width: cardWidth,
                      child: TextField(
                        controller: prompt1,
                        enabled: isEnabledP1,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        style: const TextStyle(color: Colors.black)
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        isEnabledP1 ? Icons.check : Icons.edit,
                        size: 25.0
                    ),
                    onPressed: () {
                      setState(() {
                        if (isEnabledP1) {
                          avm.setPrompt1(prompt1.text, answer1.text);
                          isEnabledP1 = false;
                        }
                        else {
                          isEnabledP1 = true;
                        }
                      });
                    }
                  ),
                ],),
                // Answer 1
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Icon(Icons.question_answer),
                  ),
                  SizedBox(
                      width: cardWidth,
                      child: TextField(
                        controller: answer1,
                        enabled: isEnabledA1,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        isEnabledA1 ? Icons.check : Icons.edit,
                        size: 25.0
                    ),
                    onPressed: () {
                      setState(() {
                        if (isEnabledA1) {
                          avm.setPrompt1(prompt1.text, answer1.text);
                          isEnabledA1 = false;
                        }
                        else {
                          isEnabledA1 = true;
                        }
                      });
                    }
                  ),
                ],),
                // Prompt 2
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Icon(Icons.question_mark_rounded),
                    ),
                    SizedBox(
                        width: cardWidth,
                        child: TextField(
                          controller: prompt2,
                          enabled: isEnabledP2,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          isEnabledP2 ? Icons.check : Icons.edit,
                          size: 25.0
                      ),
                      onPressed: () {
                        setState(() {
                          if (isEnabledP2) {
                            avm.setPrompt2(prompt2.text, answer2.text);
                            isEnabledP2 = false;
                          }
                          else {
                            isEnabledP2 = true;
                          }
                        });
                      }
                    ),
                ]),
                // Answer 2
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Icon(Icons.question_answer),
                    ),
                    SizedBox(
                      width: cardWidth,
                      child: TextField(
                        controller: answer2,
                        enabled: isEnabledA2,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        style: const TextStyle(color: Colors.white)
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        isEnabledA2 ? Icons.check : Icons.edit,
                        size: 25.0
                    ),
                    onPressed: () {
                      setState(() {
                        if (isEnabledA2) {
                          avm.setPrompt2(prompt2.text, answer2.text);
                          isEnabledA2 = false;
                        }
                        else {
                          isEnabledA2 = true;
                        }
                      });
                    }
                  ),
                ],),
                // Prompt 3
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Icon(Icons.question_mark_rounded),
                    ),
                    SizedBox(
                        width: cardWidth,
                        child: TextField(
                          controller: prompt3,
                          enabled: isEnabledP3,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          style: const TextStyle(color: Colors.black)
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          isEnabledP3 ? Icons.check : Icons.edit,
                          size: 25.0
                      ),
                      onPressed: () {
                        setState(() {
                          if (isEnabledP3) {
                            avm.setPrompt3(prompt3.text, answer3.text);
                            isEnabledP3 = false;
                          }
                          else {
                            isEnabledP3 = true;
                          }
                        });
                      }
                    ),
                ]),
                // Answer 3 (padding to avoid cutoffs on screen)
                Padding(padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 10.0),
                        child: Icon(Icons.question_answer),
                      ),
                      SizedBox(
                        width: cardWidth,
                        child: TextField(
                          controller: answer3,
                          enabled: isEnabledA3,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          style: const TextStyle(color: Colors.white)
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          isEnabledA3 ? Icons.check : Icons.edit,
                          size: 25.0
                      ),
                      onPressed: () {
                        setState(() {
                          if (isEnabledA3) {
                            avm.setPrompt3(prompt3.text, answer3.text);
                            isEnabledA3 = false;
                          }
                          else {
                            isEnabledA3 = true;
                          }
                        });
                      }
                    )
                  ],),
                ),
              ])
            )
          ],
        ),
      ),
      )
    );
  }
}