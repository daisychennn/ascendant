import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ascendant/view_model/login_view_model.dart';
import 'package:ascendant/view/my_button.dart';
import 'package:ascendant/view/survey_view.dart';

class SignUpFormWidget extends StatelessWidget {
  SignUpFormWidget({Key? key}) : super(key: key);

  final LoginViewModel loginViewModel = Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(235, 168, 248, 1.0),
      appBar: AppBar(
        title: const Text('Create Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Full Name'),
                    prefixIcon: Icon(Icons.person_outline_rounded),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Email'),
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Phone Number'),
                    prefixIcon: Icon(Icons.numbers),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Password'),
                    prefixIcon: Icon(Icons.fingerprint),
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Biography'),
                    prefixIcon: Icon(Icons.format_color_text),
                  ),
                ),
                const SizedBox(height: 10),
                MyButton(
                  onLoginPressed: null,
                  onCreateProfilePressed: null,
                  onSignWebsite: loginViewModel.launchSignWebsite, 
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Sun sign'),
                    prefixIcon: Icon(Icons.wb_sunny),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Moon sign'),
                    prefixIcon: Icon(Icons.shield_moon_outlined),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  decoration: const InputDecoration(
                    label: Text('Rising sign'),
                    prefixIcon: Icon(Icons.star_purple500_outlined),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => Survey());
                    },
                    child: const Text('SIGN UP'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
