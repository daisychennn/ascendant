import 'package:flutter/material.dart';
import 'package:ascendant/view/my_button.dart';
import 'package:ascendant/view/my_textfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
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
              Text(
                'Forgot Password?',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 20),
              const MyButton(),
              const SizedBox(height: 90),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(width: 5.0),
                    Text(
                      'Create',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}