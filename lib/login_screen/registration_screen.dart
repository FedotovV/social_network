import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vk_app/login_screen/login_screen.dart';
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
            child: Column(
              children: [
                imageVkID,
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Введите номер',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Ваш номер телефона будет использоваться для входа',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration:
                      const InputDecoration(prefixText: '+7', label: Text('')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
