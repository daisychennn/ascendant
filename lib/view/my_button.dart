import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ascendant/view/create_profile_view.dart';
import 'package:url_launcher/url_launcher.dart';

class MyButton extends StatelessWidget {
  final VoidCallback? onLoginPressed;
  final VoidCallback? onCreateProfilePressed;
  final VoidCallback? onSignWebsite; 

  const MyButton({
    Key? key,
    this.onLoginPressed,  
    this.onCreateProfilePressed,  
    this.onSignWebsite,  
  }) : super(key: key);

  Future<void> _launchSignWebsite() async {
    const url = 'https://www.astrosofa.com/horoscope/ascendant';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (onLoginPressed != null)
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(horizontal: 130),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(50),
              ),
              child: GestureDetector(
                onTap: onLoginPressed,
                child: const Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          const SizedBox(height: 20),

          if (onCreateProfilePressed != null)
            Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.symmetric(horizontal: 130),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(50),
              ),
              child: GestureDetector(
                onTap: onCreateProfilePressed,
                child: const Center(
                  child: Text(
                    'Create Profile',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          const SizedBox(height: 10),

          if (onSignWebsite != null)
            GestureDetector(
              onTap: onSignWebsite,
              child: const Text(
                'Don\'t know your sign? Click here.',
                style: TextStyle(
                  color: Color(0xFF4B0082),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
