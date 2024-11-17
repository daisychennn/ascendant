import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileView();
}

class _ProfileView extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(235, 169, 248, 1.0),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'images/logo_with_color.png',
                  width: 200.0
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                  child: Icon(
                    Icons.account_circle_rounded,
                    color: Colors.purple,
                    size: 50.0
                  )
                )
              ]
            ),
            Text(
              'Name',
              style: GoogleFonts.prata().merge(const TextStyle(color: Colors.purple, fontSize: 50.0))
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.purpleAccent,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.asset(
                      'images/pfp.png',
                      width: 300
                    )
                  )
                )
              ]
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.sunny, color: Colors.yellowAccent),
                    Text('Sun Sign', style: GoogleFonts.prata().merge(const TextStyle(color: Colors.white))),
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(CupertinoIcons.moon, color: Colors.yellowAccent),
                    Text('Moon Sign', style: GoogleFonts.prata().merge(const TextStyle(color: Colors.white))),
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.star, color: Colors.yellowAccent),
                    Text('Rising Sign', style: GoogleFonts.prata().merge(const TextStyle(color: Colors.white)))
                ])
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 150,
        color: Colors.purpleAccent,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
              child: IconButton (
                icon: const Icon(Icons.thumb_up, color: Colors.pink, size: 100),
                onPressed: () {
                  setState((){});
                }
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
              child: IconButton (
                icon: const Icon(Icons.info, color: Colors.white, size: 100),
                onPressed: () {
                  setState((){});
                }
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
              child: IconButton (
                icon: const Icon(Icons.thumb_down, color: Colors.blueAccent, size: 100),
                onPressed: () {
                  setState((){});
                }
              )
            )
          ]
        )
      ),
    );
  }
}