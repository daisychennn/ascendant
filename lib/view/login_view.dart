import 'package:flutter/material.dart';
import 'package:ascendant/view/my_button.dart';
import 'package:ascendant/view/my_textfield.dart';
import 'package:ascendant/view/create_profile_view.dart';
import 'package:ascendant/view/home_screen.dart';
import 'package:ascendant/view_model/login_view_model.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final loginViewModel = LoginViewModel();

  // Handle the login action
  void _handleLogin(BuildContext context) async {
    final username = usernameController.text.trim();
    final password = passwordController.text.trim();

    // Validate inputs
    final errorMessage = loginViewModel.validateLogin(username, password);
    if (errorMessage != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
      return;
    }
    final loginModel = loginViewModel.createLoginModel(username, password);

    // Attempt login
    final success = await loginViewModel.login(loginModel.username, loginModel.password);
    if (success) {
      Get.to(() => HomeScreen()); 
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid username or password')),
      );
    }
  }

  // Navigate to Create Profile page
  void _navigateToCreateProfile(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpFormWidget()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(235, 168, 248, 1.0),
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
              // Username Field
              MyTextField(
                controller: usernameController,
                prefixIconData: Icons.person,
                prefixIconColor: Colors.blue,
                hintText: 'Username',
                obsecureText: false,
              ),
              const SizedBox(height: 20),
              // Password Field
              MyTextField(
                controller: passwordController,
                prefixIconData: Icons.lock,
                prefixIconColor: Colors.blue,
                hintText: 'Password',
                obsecureText: true,
              ),
              const SizedBox(height: 20),
              // Login and Create Profile Buttons
              MyButton(
                onLoginPressed: () => _handleLogin(context),
                onCreateProfilePressed: () => _navigateToCreateProfile(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
