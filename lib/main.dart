import 'package:ascendant/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:ascendant/view/login_view.dart';
import 'package:ascendant/view/messages_view.dart';
import 'package:get/get.dart';
import 'package:ascendant/theme.dart';

void main() {
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

  // const MyApp({Key? key}) : super(key: key);
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     theme: AppTheme.light(),
  //     darkTheme: AppTheme.dark(),
  //     themeMode: ThemeMode.light,
  //     title: 'Chatter',
  //     home: HomeScreen(),
  //   );
  // }
}
