import 'package:flutter/material.dart';
import 'package:vk_app/login_screen/start_screen.dart';
import 'login_screen/login_screen.dart';
import 'login_screen/registration_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const LoginScreen();
  }
}
