import 'package:flutter/material.dart';
import 'package:vk_app/login_screen/start_screen.dart';
import 'package:vk_app/main_screen/my_profile/avatar_name_info.dart';
import 'package:vk_app/main_screen/my_profile/set_status.dart';
import 'login_screen/login_screen.dart';
import 'login_screen/registration_screen/registration_screen.dart';
import 'login_screen/user_editing_screen/user_editing.dart';
import 'main_screen/user_home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      routes: {
        '/start_screen': (context) => const StartScreen(),
        '/registration_screen': (context) => const RegistrationScreen(),
        '/login_screen': (context) => const LoginScreen(),
        '/user_home_screen': (context) => const UserHomeScreen(),
        '/user_home': (context) => const UserHomeScreen(),
        '/user_editing': (context) => const UserEditing(),
        '/set_status_profile': (context) => const SetStatusWidget(),
      },
      initialRoute: '/user_home',
    );
  }
}
