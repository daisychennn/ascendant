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
  bool isEnabled = false;

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
                Image.asset(
                  'images/logo_with_color.png',
                  width: 400.0,
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
                flex: 5,
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
                flex: 5,
                child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                    SizedBox(
                      width: 100,
                      child: TextField(
                        controller: prompt1,
                        enabled: isEnabled,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.edit,
                        size: 25.0
                      ),
                      onPressed: () {
                        setState(() {
                          isEnabled = true;
                        });
                      }
                    ),
                    const Text('Answer 1')
                  ],),
                  const Row(children: [
                    Text('Prompt 2'),
                    Text('Answer 2')
                  ],),
                  const Row(children: [
                    Text('Prompt 3'),
                    Text('Answer 3')
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