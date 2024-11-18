import 'package:ascendant/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:ascendant/view/login_view.dart';
import 'package:ascendant/view/messages_view.dart';
import 'package:get/get.dart';
import 'package:ascendant/theme.dart';
import 'package:flutter/foundation.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
