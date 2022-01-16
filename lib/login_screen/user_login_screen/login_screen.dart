import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vk_app/items/logos.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loginController.addListener(() {
      setState(() {});
    });
  }

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
    }
    if (value != 'q') {
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
        body: SingleChildScrollView(
          child: Form(
            key: _loginKey,
            child: SafeArea(
              minimum: const EdgeInsets.all(28.0),
              child: Column(children: [
                Logos.imageVkID,
                const SizedBox(
                  height: 100,
                ),
                Logos.logoVK,
                const SizedBox(
                  height: 100,
                ),
                TextFormField(
                  controller: _loginController,
                  keyboardType: TextInputType.emailAddress,
                  keyboardAppearance: Brightness.light,
                  validator: validatorLogin,
                  inputFormatters: [LengthLimitingTextInputFormatter(30)],
                  decoration: InputDecoration(
                    hintText: 'Email или телефон',
                    enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.elliptical(10, 10),
                        ),
                        borderSide: BorderSide(color: Colors.white)),
                    fillColor: const Color(0xFFF7F7F7),
                    suffixIcon: _loginController.text.isNotEmpty
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                _loginController.clear();
                              });
                            },
                            icon: const Icon(Icons.cancel),
                            color: Colors.grey,
                            splashColor: Colors.white,
                            focusColor: Colors.grey,
                          )
                        : null,
                    focusedBorder: const OutlineInputBorder(
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
                  keyboardType: TextInputType.text,
                  keyboardAppearance: Brightness.light,
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
                        icon: Icon(_hidePassword
                            ? Icons.visibility
                            : Icons.visibility_off)),
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
                        _loginController.text == 'q' &&
                        _passwordController.text == 'q') {
                      Navigator.pushNamed(context, '/user_home_screen');
                    } else if (_passwordController.text != 'q') {}
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
      shadowColor: MaterialStateProperty.all<Color>(Colors.white),
      splashFactory: NoSplash.splashFactory,
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
      splashFactory: NoSplash.splashFactory,
      shadowColor: MaterialStateProperty.all<Color>(Colors.white),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)))),
);
