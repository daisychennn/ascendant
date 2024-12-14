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
  /*
    All quips sourced from https://www.today.com/life/astrology/sun-moon-rising-meaning-rcna23286.
  */
  Map<String, String> sunQuips = {
    'Aries' : 'tend to be motivated to face their fears and blow past hesitation.',
    'Taurus' : 'are often thought to have grounded personalities and exhibit loyal and stubborn behaviors.',
    'Gemini' : 'are talkative and their dualistic nature allows them to see situations from a number of perspectives.',
    'Cancer' : 'are emotionally mature and intuitive. They are guided by their protective and loving hearts.',
    'Leo' : 'are known to be creative, playful, and bold. They are often centered around ego, will, and character.',
    'Virgo' : 'are known for their intelligence, diligent information processing, and problem-solving.',
    'Libra' : 'are vibrant, critical, artistic, and extremely stylish.',
    'Scorpio' : 'tend to be intense, mysterious, and ever-evolving.',
    'Sagittarius' : 'are free-spirited, globe-trotting, and philosophical with a wild streak.',
    'Capricorn' : 'tend to work hard toward advancing themselves in earthly matters.',
    'Aquarius' : 'seek out unique ways to solve problems and approach life and are known for their intellect and innovativeness.',
    'Pisces' : 'have sentimental, intuitive, imaginative, and dreamy dispositions.'
  };
  Map<String, String> moonQuips = {
    'Aries' : 'can be emotionally responsive and implusive as they lead with fiery passions.',
    'Taurus' : 'delight in earthly pleasures and seek out emotional security.',
    'Gemini' : 'often discuss their complex feelings with others in order to gain a mindful emotional perspective.',
    'Cancer' : 'have limitless emotions leading to sweetness, kindness, emotional awareness, and responsibility.',
    'Leo' : 'possess extreme inner warmth and generousity. They often express this towards those they care about.',
    'Virgo' : 'use their calm nature to gain deep clarity on matters and filter questions through a reasonable lens.',
    'Libra' : 'base decisions on how they are viewed by others often making them relationship-oriented.',
    'Scorpio' : 'have brooding natures exuding passion. They are loyal and display unconditional love when won over.',
    'Sagittarius' : 'can be defensive but also bring excitement, adventure, and abundance.',
    'Capricorn' : 'are reflective and contemplative. They work to build better foundations with those they care about.',
    'Aquarius' : 'combines logic with sentimentality to reach deeper understandings of their inner lives.',
    'Pisces' : 'understand the needs of others and can likely predict what\'s on your mind.'
  };
  Map<String, String> risingQuips = {
    'Aries' : 'do not let anything stand in the way of their personal goals.',
    'Taurus' : 'exude grace and sophistication, and handle business with a sweet disposition.',
    'Gemini' : 'are quick-witted, fast communicators, and express themselves in unique manners.',
    'Cancer' : 'tend to wear their hearts on their sleeves and take care of those they love.',
    'Leo' : 'radiate positivity and charm with outgoing and friendly personalities that exude confidence and strength.',
    'Virgo' : 'are known as the reasoners with fair-minded dispositions that are slow to anger.',
    'Libra' : 'prefer civil matters and finding balance in life is essential for them.',
    'Scorpio' : 'are extremely magnetic and dynamic but beware they are not known to back away from a challenge.',
    'Sagittarius' : 'have contagious confidence, optimism, lots of energy, and jovial natures.',
    'Capricorn' : 'are known for diligence and effort in attaining success and prosperity.',
    'Aquarius' : 'speak knowledgably on numerous topics, charm crowds with their knowledge, and solve problems well.',
    'Pisces' : 'commits fully to their beliefs, and has an active imagination.'
  };
  
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
                    isScrollControlled: true,
                    constraints: BoxConstraints(
                      maxWidth: Get.width,
                    ),
                    builder: (context) {
                      return Wrap (
                        children: [
                          ListTile(
                            minLeadingWidth: 20,
                            tileColor: Colors.purpleAccent,
                            leading: const Icon(
                              Icons.close, color: Colors.white,
                            ),
                            title: Text('About ${currProf.getName}',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.prata().merge(const TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold))
                            ),
                            onTap: () {
                              Navigator.pop(context);
                            }
                          ),
                          Container(
                            width: Get.width,
                            color: Colors.purpleAccent,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20, right: 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(Icons.sunny, color: Colors.yellow),
                                        Expanded(
                                          child: Text(
                                            'People with ${currProf.getBigThree()[0]} sun signs ${sunQuips[currProf.getBigThree()[0]]}',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.prata().merge(const TextStyle(color: Colors.white)),
                                          ),
                                        ),
                                    ]),
                                    Row(children: [
                                      const Icon(CupertinoIcons.moon, color: Colors.yellow),
                                      Expanded(
                                        child: Text(
                                          'People with ${currProf.getBigThree()[1]} moon signs ${moonQuips[currProf.getBigThree()[1]]}',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.prata().merge(const TextStyle(color: Colors.white))
                                        ),
                                      )
                                    ],),
                                    Row(children: [
                                      const Icon(Icons.star, color: Colors.yellow),
                                      Expanded(
                                        child: Text(
                                          'People with ${currProf.getBigThree()[2]} rising signs ${risingQuips[currProf.getBigThree()[2]]}',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.prata().merge(const TextStyle(color: Colors.white))
                                        ),
                                      )
                                    ])
                                ],),
                            )
                          ),
                          ListTile(
                            minLeadingWidth: 30,
                            tileColor: Colors.purpleAccent,
                            title: Text('Prompts from ${currProf.getName}',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.prata().merge(const TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold))
                            ),
                          ),
                          Container(
                            width: Get.width,
                            color: Colors.purpleAccent,
                            child: Padding( 
                              padding: const EdgeInsets.all(10),
                              child: Expanded( 
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                  Text(
                                    currProf.getPrompts()[0][0],
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.prata().merge(const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                                  ),
                                  Text(
                                    currProf.getPrompts()[0][1],
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.prata().merge(const TextStyle(color: Colors.white, fontStyle: FontStyle.italic))
                                  ),
                                  Text(
                                    currProf.getPrompts()[1][0],
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.prata().merge(const TextStyle(color: Colors.black, fontWeight: FontWeight.bold))
                                  ),
                                  Text(
                                    currProf.getPrompts()[1][1],
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.prata().merge(const TextStyle(color: Colors.white, fontStyle: FontStyle.italic))
                                  ),
                                  Text(
                                    currProf.getPrompts()[2][0],
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.prata().merge(const TextStyle(color: Colors.black, fontWeight: FontWeight.bold))
                                  ),
                                  Text(
                                    currProf.getPrompts()[2][1],
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.prata().merge(const TextStyle(color: Colors.white, fontStyle: FontStyle.italic))
                                  )
                                ],),
                              )
                            )
                          ),
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