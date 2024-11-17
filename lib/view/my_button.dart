import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ascendant/view/create_profile_view.dart';

class MyButton extends StatelessWidget {
  final VoidCallback onLoginPressed;
  final VoidCallback onCreateProfilePressed;

  const MyButton({
    super.key,
    required this.onLoginPressed,
    required this.onCreateProfilePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
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
        ],
      ),
    );
  }
}
