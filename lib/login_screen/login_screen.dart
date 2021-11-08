import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vk_app/login_screen/start_screen.dart';
import 'package:vk_app/main_screen/user_home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? validatorLogin(value) {
    if (value.isEmpty) {
      return 'Поле пустое, введите email-адрес или номер телефона';
    } else {
      return null;
    }
  }

  String? validatorPassword(value) {
    if (value.isEmpty) {
      return 'Поле не может быть пустым, введите пароль';
    } else {
      return null;
    }
  }

  String? wrongPassword(value) {
    if (value != 'admin') {
      return 'Неправильный пароль';
    } else {
      return null;
    }
  }

  final _loginKey = GlobalKey<FormState>();
  bool _hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: _loginKey,
          child: SafeArea(
            minimum: const EdgeInsets.all(28.0),
            child: Column(children: [
              imageVkID,
              const SizedBox(
                height: 100,
              ),
              logoVK,
              const SizedBox(
                height: 100,
              ),
              TextFormField(
                controller: _loginController,
                validator: validatorLogin,
                inputFormatters: [LengthLimitingTextInputFormatter(30)],
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
                controller: _passwordController,
                validator: validatorPassword,
                obscureText: _hidePassword,
                inputFormatters: [LengthLimitingTextInputFormatter(30)],
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
                    onPressed: () {
                      setState(() {
                        _hidePassword = !_hidePassword;
                      });
                    },
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(right: 45),
                    icon: Row(
                      mainAxisSize: MainAxisSize.min,
                      verticalDirection: VerticalDirection.up,
                      children: [
                        const Icon(Icons.help_outline_rounded),
                        const SizedBox(
                          width: 5,
                        ),
                        Icon(_hidePassword
                            ? Icons.visibility
                            : Icons.visibility_off)
                      ],
                    ),
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
              OutlinedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blueAccent),
                  // padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  //     const EdgeInsets.symmetric(horizontal: 100))
                  fixedSize:
                      MaterialStateProperty.all<Size>(const Size(365, 45)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                ),
                onPressed: () {
                  if (_loginKey.currentState!.validate() &&
                      _loginController.text == 'admin' &&
                      _passwordController.text == 'admin') {
                    Navigator.pushNamed(context, '/user_home_screen');
                  } else if (_passwordController.text != 'admin') {
                    wrongPassword;
                  }
                },
                child: const Text(
                  'Войти',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(
                height: 180,
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

Image imageVkID = Image.asset(
  'assets/images/vkID.png',
  alignment: Alignment.center,
  height: 24,
);
