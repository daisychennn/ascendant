import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:ascendant/view/login_view.dart';

class ThankYouPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thank You'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Thank you for being interested in using Ascendant!\n'
              'We will review your answers to ensure you are a good fit for our app <3',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center, 
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.to(() => LoginPage());
              },
              child: const Text('Go Back to Login'),
            ),
          ],
        ),
      ),
    );
  }
}
