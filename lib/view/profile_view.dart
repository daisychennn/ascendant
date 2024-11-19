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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Fiona FakePerson',
              style: GoogleFonts.prata().merge(const TextStyle(color: Colors.purple, fontSize: 40.0)),
              textAlign: TextAlign.center,
            ),
          Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 20.0),
                child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.purpleAccent,
                        width: 5,
                      ),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage('https://images.unsplash.com/photo-1632324343640-86af9827dbeb?q=80&w=987&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D')
                      )
                    )
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.sunny, color: Colors.yellowAccent),
                    Text('Gemini', style: GoogleFonts.prata().merge(const TextStyle(color: Colors.white))),
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(CupertinoIcons.moon, color: Colors.yellowAccent),
                    Text('Virgo', style: GoogleFonts.prata().merge(const TextStyle(color: Colors.white))),
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.star, color: Colors.yellowAccent),
                    Text('Libra', style: GoogleFonts.prata().merge(const TextStyle(color: Colors.white)))
                ])
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 100,
        color: const Color.fromARGB(178, 223, 64, 251),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
              child: IconButton (
                icon: const Icon(Icons.thumb_up, color: Colors.pink, size: 40),
                onPressed: () {
                  setState((){});
                }
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
              child: IconButton (
                icon: const Icon(Icons.info, color: Colors.white, size: 40),
                onPressed: () {
                  setState((){});
                }
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
              child: IconButton (
                icon: const Icon(Icons.thumb_down, color: Colors.lightBlueAccent, size: 40),
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