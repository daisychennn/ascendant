import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:ascendant/view_model/profile_view_model.dart';
import 'package:ascendant/models/user_model.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileView();
}

class _ProfileView extends State<ProfileView> {
  ProfileViewModel pvm = ProfileViewModel('prof1@fake.email');
  UserModel? profile;

  @override
  Widget build(BuildContext context) {
    if (profile == null) {
      if (pvm.nextProfile() != null) {
        profile = pvm.nextProfile();
      }
      else {
        return Scaffold(
          backgroundColor:  const Color.fromRGBO(235, 169, 248, 1.0),
          body: Center(
            child: Text('No more matches :(',
              style: GoogleFonts.prata()
                .merge(Theme.of(context).textTheme.headlineLarge)
                .merge(const TextStyle(color: Colors.purpleAccent, fontWeight: FontWeight.bold))
            )
          )
        );
      }
    }
    UserModel currProf = profile as UserModel;
    
    return Scaffold(
      backgroundColor: const Color.fromRGBO(235, 169, 248, 1.0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          // Title
          Text(
            currProf.getName,
            style: GoogleFonts.prata().merge(const TextStyle(color: Colors.purple, fontSize: 40.0)),
            textAlign: TextAlign.center,
          ),
          // Profile Picture
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
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: currProf.getPicture
                      )
                    )
              ),
            ),
            // Sun, Moon, and Rising Sign
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.sunny, color: Colors.yellowAccent),
                    Text(currProf.getBigThree()[0], style: GoogleFonts.prata().merge(const TextStyle(color: Colors.white))),
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(CupertinoIcons.moon, color: Colors.yellowAccent),
                    Text(currProf.getBigThree()[1], style: GoogleFonts.prata().merge(const TextStyle(color: Colors.white))),
                ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.star, color: Colors.yellowAccent),
                    Text(currProf.getBigThree()[2], style: GoogleFonts.prata().merge(const TextStyle(color: Colors.white)))
                ])
              ],
            )
          ],
        ),
      ),
      // Like, Dislike, and More Infor Features
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
                  setState((){
                    pvm.addMatch(pvm.fetchMatchEmail(currProf));
                    profile = pvm.nextProfile();
                  });
                }
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
              child: IconButton (
                icon: const Icon(Icons.info, color: Colors.white, size: 40),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    constraints: BoxConstraints(
                      maxWidth: Get.width,
                    ),
                    builder: (context) {
                      return Wrap (
                        children: [
                          ListTile(
                            minLeadingWidth: 100,
                            tileColor: Colors.purpleAccent,
                            leading: const Icon(
                              Icons.close, color: Colors.white,
                            ),
                            title: Text('About ${currProf.getName}',
                              style: GoogleFonts.prata().merge(const TextStyle(color: Colors.white))
                            ),
                            onTap: () {
                              Navigator.pop(context);
                            }
                          ),
                          Container(
                            width: Get.width,
                            color: Colors.purpleAccent,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                              Text(
                                currProf.getPrompts()[0][0],
                                style: GoogleFonts.prata().merge(const TextStyle(color: Colors.black, fontWeight: FontWeight.bold))
                              ),
                              Text(
                                currProf.getPrompts()[0][1],
                                style: GoogleFonts.prata().merge(const TextStyle(color: Colors.white, fontStyle: FontStyle.italic))
                              ),
                              Text(
                                currProf.getPrompts()[1][0],
                                style: GoogleFonts.prata().merge(const TextStyle(color: Colors.black, fontWeight: FontWeight.bold))
                              ),
                              Text(
                                currProf.getPrompts()[1][1],
                                style: GoogleFonts.prata().merge(const TextStyle(color: Colors.white, fontStyle: FontStyle.italic))
                              ),
                              Text(
                                currProf.getPrompts()[2][0],
                                style: GoogleFonts.prata().merge(const TextStyle(color: Colors.black, fontWeight: FontWeight.bold))
                              ),
                              Text(
                                currProf.getPrompts()[2][1],
                                style: GoogleFonts.prata().merge(const TextStyle(color: Colors.white, fontStyle: FontStyle.italic))
                              )
                            ],),
                          ),
                          const ListTile(
                            tileColor: Colors.purpleAccent,
                            minLeadingWidth: 100,
                          )
                        ]
                      );
                    }
                  );
                }
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
              child: IconButton (
                icon: const Icon(Icons.thumb_down, color: Colors.lightBlueAccent, size: 40),
                onPressed: () {
                  setState((){
                    profile = pvm.nextProfile();
                  });
                }
              )
            )
          ]
        )
      ),
    );
  }
}