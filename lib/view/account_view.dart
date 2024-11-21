import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// import 'package:ascendant/view_model/account_view_model.dart';

class AccountView extends StatefulWidget {
  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountView();
  // AccountViewModel account; - will use to send data
}

class _AccountView extends State<AccountView> {
  TextEditingController prompt1 = TextEditingController(text: 'Dating me is like...');
  bool isEnabledP1 = false;
  TextEditingController answer1 = TextEditingController(text: 'I\'m not a real person');
  bool isEnabledA1 = false;

  TextEditingController prompt2 = TextEditingController(text: 'Don\'t hate me if I...');
  bool isEnabledP2 = false;
  TextEditingController answer2 = TextEditingController(text: 'am a fake profile');
  bool isEnabledA2 = false;

  TextEditingController prompt3 = TextEditingController(text: 'I bet you can\'t...');
  bool isEnabledP3 = false;
  TextEditingController answer3 = TextEditingController(text: 'find me! Still not real!');
  bool isEnabledA3 = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth * 0.75; // 80% of screen width

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
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage('https://images.unsplash.com/photo-1723200166097-4eed8c141f03?q=80&w=987&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D')
                        )
                      )
                ),
              )
            ),

            // User information that can be edited - will need actual data
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.person, color: Colors.purple),
                Text('Natalie NotAName'),
            ],),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.cake, color: Colors.purple),
                Text('21'),
            ],),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.sunny, color: Colors.yellowAccent),
                Text('Taurus'),
            ],),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(CupertinoIcons.moon, color: Colors.yellowAccent),
                Text('Leo'),
            ],),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star, color: Colors.yellowAccent),
                Text('Aries'),
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