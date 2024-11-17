import 'package:flutter/material.dart';

// import 'package:ascendant/view_model/account_view_model.dart';

class AccountView extends StatefulWidget {
  const AccountView({super.key});

  @override
  State<AccountView> createState() => _AccountView();
  // AccountViewModel account; - will use to send data
}

class _AccountView extends State<AccountView> {
  TextEditingController prompt1 = TextEditingController(text: 'Prompt 1');
  bool isEnabledP1 = false;
  TextEditingController answer1 = TextEditingController(text: 'Answer 1');
  bool isEnabledA1 = false;

  TextEditingController prompt2 = TextEditingController(text: 'Prompt 2');
  bool isEnabledP2 = false;
  TextEditingController answer2 = TextEditingController(text: 'Answer 2');
  bool isEnabledA2 = false;

  TextEditingController prompt3 = TextEditingController(text: 'Prompt 3');
  bool isEnabledP3 = false;
  TextEditingController answer3 = TextEditingController(text: 'Answer 3');
  bool isEnabledA3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(235, 168, 248, 1.0),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                  child: Image.asset(
                    'images/logo_stars.png',
                    width: 50.0,
                  ),
                ),
                const Padding(
                    padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                    child: Icon(
                      Icons.account_circle_rounded,
                      color: Colors.purple,
                      size: 50.0
                    )
                ),
              ],
            ),
            Center(
              child:
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 20.0, 20.0, 20.0),
                  child: Container(
                      width: 400,
                      height: 400,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.purpleAccent,
                          width: 5,
                        ),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('images/pfp.png')
                        )
                      )
                ),
              )
            ),
            Row(
              children: <Widget> [
              // User Information that can't be edited
              const Expanded(
                flex: 4,
                child: Column(
                  children: [
                    Text('Name'),
                    Text('Age'),
                    Text('Sun'),
                    Text('Moon'),
                    Text('Rising')
                  ]
                ),
              ),
              // User information that can be edited
              Expanded(
                flex: 6,
                child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: 100,
                        child: TextField(
                          controller: prompt1,
                          enabled: isEnabledP1,
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
                    SizedBox(
                        width: 100,
                        child: TextField(
                          controller: answer1,
                          enabled: isEnabledA1,
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
                    )
                  ],),
                  Row(children: [
                    SizedBox(
                        width: 100,
                        child: TextField(
                          controller: prompt2,
                          enabled: isEnabledP2,
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
                    SizedBox(
                        width: 100,
                        child: TextField(
                          controller: answer2,
                          enabled: isEnabledA2,
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
                    )
                  ],),
                  Row(children: [
                    SizedBox(
                        width: 100,
                        child: TextField(
                          controller: prompt3,
                          enabled: isEnabledP3,
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
                    SizedBox(
                        width: 100,
                        child: TextField(
                          controller: answer3,
                          enabled: isEnabledA3,
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
                  ],)
                ])
              )
            ])
          ],
        ),
      ),
    );
  }
}