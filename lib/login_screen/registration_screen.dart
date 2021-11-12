import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:vk_app/items/logos.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _phoneNumber = TextEditingController();
  final _phoneFocus = FocusNode();

  @override
  void dispose() {
    _phoneNumber.dispose();
    _phoneFocus.dispose();
    super.dispose();
  }

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
                Logos.imageVkID,
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Введите номер',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Ваш номер телефона будет использоваться для входа в аккаунт',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  autofocus: true,
                  controller: _phoneNumber,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: InputDecoration(
                    prefixText: '  +7  |  ',
                    prefixStyle: const TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                    label: const Text(''),
                    labelStyle: const TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                    suffixIcon: IconButton(
                      splashColor: Colors.white,
                      color: Colors.grey,
                      icon: const Icon(Icons.cancel),
                      onPressed: () {},
                    ),
                    enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.elliptical(10, 10),
                        ),
                        borderSide: BorderSide(color: Colors.white)),
                    fillColor: const Color(0xFFF7F7F7),
                    filled: true,
                    focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.elliptical(10, 10),
                        ),
                        borderSide: BorderSide(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
