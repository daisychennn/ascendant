import 'package:flutter/material.dart';
import 'package:ascendant/view_model/user_service.dart';
import 'package:ascendant/view/survey_view.dart';
import 'package:get/get.dart';

class SignUpFormWidget extends StatelessWidget {
  SignUpFormWidget({Key? key}) : super(key: key);

  // Controllers for text fields
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final biographyController = TextEditingController();
  final sunSignController = TextEditingController();
  final moonSignController = TextEditingController();
  final risingSignController = TextEditingController();

  void _saveProfile(BuildContext context) async {
    final fullName = fullNameController.text.trim();
    final email = emailController.text.trim();
    final phoneNumber = phoneNumberController.text.trim();
    final password = passwordController.text.trim();
    final biography = biographyController.text.trim();
    final sunSign = sunSignController.text.trim();
    final moonSign = moonSignController.text.trim();
    final risingSign = risingSignController.text.trim();

    // Create a new user model 
    final userProfile = {
      "fullName": fullName,
      "email": email,
      "phoneNumber": phoneNumber,
      "password": password,
      "biography": biography,
      "sunSign": sunSign,
      "moonSign": moonSign,
      "risingSign": risingSign,
    };

    // Save to users.json (using UserService)
    final userService = UserService();
    await userService.saveUserData(userProfile);

    // Navigate to survey
    Get.to(() => Survey()); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Wrap in Scaffold
      backgroundColor: const Color.fromRGBO(235, 168, 248, 1.0),
      appBar: AppBar(
        title: const Text('Create Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: fullNameController,
                decoration: const InputDecoration(
                  label: Text('Full Name'),
                  prefixIcon: Icon(Icons.person_outline_rounded),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  label: Text('Email'),
                  prefixIcon: Icon(Icons.email_outlined),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: phoneNumberController,
                decoration: const InputDecoration(
                  label: Text('Phone Number'),
                  prefixIcon: Icon(Icons.numbers),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                  label: Text('Password'),
                  prefixIcon: Icon(Icons.fingerprint),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: biographyController,
                decoration: const InputDecoration(
                  label: Text('User\'s biography'),
                  prefixIcon: Icon(Icons.format_color_text),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: sunSignController,
                decoration: const InputDecoration(
                  label: Text('Sun sign'),
                  prefixIcon: Icon(Icons.wb_sunny),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: moonSignController,
                decoration: const InputDecoration(
                  label: Text('Moon sign'),
                  prefixIcon: Icon(Icons.shield_moon_outlined),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: risingSignController,
                decoration: const InputDecoration(
                  label: Text('Rising sign'),
                  prefixIcon: Icon(Icons.star_purple500_outlined),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => _saveProfile(context),
                  child: const Text('SIGN UP'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
