import 'package:flutter/material.dart';
import 'package:vk_app/login_screen/start_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          child: SafeArea(
            minimum: const EdgeInsets.all(28.0),
            child: Column(children: [
              Image.asset(
                'assets/images/vkID.png',
                alignment: Alignment.center,
                height: 24,
              ),
              const SizedBox(
                height: 100,
              ),
              logoVK,
              const SizedBox(
                height: 100,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Email или телефон',
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.elliptical(10, 10),
                      ),
                      borderSide: BorderSide(color: Colors.white)),
                  fillColor: Color(0xFFF7F7F7),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.elliptical(10, 10),
                      ),
                      borderSide: BorderSide(color: Colors.white)),
                  filled: true,
                ),
              ),
              // const Divider(
              //   color: Colors.grey,
              // ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Пароль',
                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.elliptical(10, 10),
                      ),
                      borderSide: BorderSide(color: Colors.white)),
                  fillColor: const Color(0xFFF7F7F7),
                  filled: true,
                  suffixIcon: IconButton(
                    color: Colors.grey,
                    splashColor: Colors.white,
                    focusColor: Colors.grey,
                    onPressed: () {},
                    icon: const Icon(Icons.help_outline_rounded),
                    iconSize: 28.0,
                  ),
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.elliptical(10, 10),
                      ),
                      borderSide: BorderSide(color: Colors.white)),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              loginButton,
              const SizedBox(
                height: 190,
              ),
              loginFacebookButton,
              const SizedBox(
                height: 10,
              ),
              loginAppleButton,
            ]),
          ),
        ),
      ),
    );
  }
}

OutlinedButton loginFacebookButton = OutlinedButton(
  onPressed: () {},
  child: Row(
    children: [
      Image.asset(
        'assets/images/fbLogo.png',
        alignment: Alignment.bottomCenter,
        height: 25,
      ),
      const SizedBox(
        width: 45,
      ),
      const Text(
        'Войти через Facebook',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
      ),
    ],
  ),
  style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
      fixedSize: MaterialStateProperty.all<Size>(const Size(365, 45)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)))),
);

OutlinedButton loginAppleButton = OutlinedButton(
  onPressed: () {},
  child: Row(
    children: [
      Image.asset(
        'assets/images/aplLogo.png',
        alignment: Alignment.bottomCenter,
        height: 27,
      ),
      const SizedBox(
        width: 85,
      ),
      const Text(
        'Вход с Apple',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
      ),
    ],
  ),
  style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
      fixedSize: MaterialStateProperty.all<Size>(const Size(365, 45)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)))),
);
