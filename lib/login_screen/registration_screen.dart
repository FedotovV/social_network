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
                height: 75,
              ),
              logoVK,
              const SizedBox(
                height: 75,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Email или телефон',
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                      borderSide: BorderSide(color: Colors.grey)),
                  fillColor: Colors.grey,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                      borderSide: BorderSide(color: Colors.grey)),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Пароль',
                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                      borderSide: BorderSide(color: Colors.grey)),
                  fillColor: Colors.grey,
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
                        Radius.circular(15.0),
                      ),
                      borderSide: BorderSide(color: Colors.grey)),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
