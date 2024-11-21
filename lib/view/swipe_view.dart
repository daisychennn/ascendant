import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SwipeView extends StatefulWidget {
  const SwipeView({super.key});

  @override
  State<SwipeView> createState() => _SwipeView();
}

// STILL IN DEVELOPMENT - WILL BE THE MATCH PAGE (RIGHT NOW A VERSION OF PROFILE VIEW)
class _SwipeView extends State<SwipeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(0, 235, 169, 248),
      body: Center(
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                  child: Icon(CupertinoIcons.sparkles, color: Colors.yellowAccent, size: 50.0),
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
              padding: const EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 0.0),
              child: IconButton (
                icon: const Icon(Icons.thumb_up, color: Colors.pink, size: 40),
                onPressed: () {
                  setState((){});
                }
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 0.0),
              child: IconButton (
                icon: const Icon(Icons.info, color: Colors.white, size: 40),
                onPressed: () {
                  setState((){});
                }
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 0.0),
              child: IconButton (
                icon: const Icon(Icons.thumb_down, color: Colors.blueAccent, size: 40),
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