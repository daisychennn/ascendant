import 'package:flutter/material.dart';
import 'package:ascendant/view/my_button.dart';
import 'package:ascendant/view/my_textfield.dart';
import 'package:ascendant/view/create_profile_view.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(235, 168, 248, 1.0),
      // backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50),
              Image.asset(
                'assets/images/logo.png',
                width: 300,
              ),
              const SizedBox(height: 50),
              MyTextField(
                controller: usernameController,
                prefixIconData: Icons.person,
                prefixIconColor: Colors.blue,
                hintText: 'Username',
                obsecureText: false,
              ),
              const SizedBox(height: 20),
              MyTextField(
                controller: passwordController,
                prefixIconData: Icons.lock,
                prefixIconColor: Colors.blue,
                hintText: 'Password',
                obsecureText: true,
              ),
              const SizedBox(height: 20),
              const MyButton()
            ],
          ),
        ),
      ),
    );
  }
}