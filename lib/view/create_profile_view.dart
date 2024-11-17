// create_profile_view.dart
import 'package:flutter/material.dart';
import 'package:ascendant/view/survey_view.dart';
import 'package:ascendant/view_model/login_view_model.dart'; 
import 'package:get/get.dart';

class SignUpFormWidget extends StatefulWidget {
  const SignUpFormWidget({Key? key}) : super(key: key);

  @override
  _SignUpFormWidgetState createState() => _SignUpFormWidgetState();
}

class _SignUpFormWidgetState extends State<SignUpFormWidget> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController biographyController = TextEditingController();
  final TextEditingController sunSignController = TextEditingController();
  final TextEditingController moonSignController = TextEditingController();
  final TextEditingController risingSignController = TextEditingController();

  final LoginViewModel loginViewModel = LoginViewModel();

  // Handle sign up action
  void _handleSignUp() {
    final username = usernameController.text.trim();
    final password = passwordController.text.trim();
    final fullName = fullNameController.text.trim();
    final email = emailController.text.trim();
    final phone = phoneController.text.trim();
    final biography = biographyController.text.trim();
    final sunSign = sunSignController.text.trim();
    final moonSign = moonSignController.text.trim();
    final risingSign = risingSignController.text.trim();

    if (username.isEmpty ||
        password.isEmpty ||
        fullName.isEmpty ||
        email.isEmpty ||
        phone.isEmpty ||
        biography.isEmpty ||
        sunSign.isEmpty ||
        moonSign.isEmpty ||
        risingSign.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('All fields are required!')),
      );
      return;
    }

    final newUser = loginViewModel.createLoginModel(
      username: username,
      password: password,
      fullName: fullName,
      email: email,
      phoneNumber: phone,
      biography: biography,
      sunSign: sunSign,
      moonSign: moonSign,
      risingSign: risingSign,
    );

    // Save user profile to users.json
    loginViewModel.saveUserProfile(newUser).then((_) {
      // Navigate to survey view after saving the user data
      Get.to(() => Survey());
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $error')),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                controller: phoneController,
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
                  label: Text('User\'s Biography'),
                  prefixIcon: Icon(Icons.format_color_text),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: sunSignController,
                decoration: const InputDecoration(
                  label: Text('Sun Sign'),
                  prefixIcon: Icon(Icons.wb_sunny),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: moonSignController,
                decoration: const InputDecoration(
                  label: Text('Moon Sign'),
                  prefixIcon: Icon(Icons.shield_moon_outlined),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: risingSignController,
                decoration: const InputDecoration(
                  label: Text('Rising Sign'),
                  prefixIcon: Icon(Icons.star_purple500_outlined),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _handleSignUp,
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



// import 'package:ascendant/view/survey_view.dart';
// import 'package:get/get.dart';

// class SignUpFormWidget extends StatelessWidget {
//   const SignUpFormWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold( // Wrap in Scaffold
//       backgroundColor: const Color.fromRGBO(235, 168, 248, 1.0),
//       appBar: AppBar(
//         title: const Text('Create Profile'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
//         child: Form(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TextFormField(
//                 decoration: const InputDecoration(
//                   label: Text('Full Name'),
//                   prefixIcon: Icon(Icons.person_outline_rounded),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               TextFormField(
//                 decoration: const InputDecoration(
//                   label: Text('Email'),
//                   prefixIcon: Icon(Icons.email_outlined),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               TextFormField(
//                 decoration: const InputDecoration(
//                   label: Text('Phone Number'),
//                   prefixIcon: Icon(Icons.numbers),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               TextFormField(
//                 decoration: const InputDecoration(
//                   label: Text('Password'),
//                   prefixIcon: Icon(Icons.fingerprint),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               TextFormField(
//                 decoration: const InputDecoration(
//                   label: Text('User \'s biography'),
//                   prefixIcon: Icon(Icons.format_color_text),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               TextFormField(
//                 decoration: const InputDecoration(
//                   label: Text('Sun sign'),
//                   prefixIcon: Icon(Icons.wb_sunny),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               TextFormField(
//                 decoration: const InputDecoration(
//                   label: Text('Moon sign'),
//                   prefixIcon: Icon(Icons.shield_moon_outlined),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               TextFormField(
//                 decoration: const InputDecoration(
//                   label: Text('Rising sign'),
//                   prefixIcon: Icon(Icons.star_purple500_outlined),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: () => Get.to(() => Survey()),
//                   child: const Text('SIGN UP'),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
