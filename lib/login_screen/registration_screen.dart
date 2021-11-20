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
  String _phoneText = '';

  final _phoneNumber = TextEditingController();
  final _phoneFocus = FocusNode();
  final _phoneExp = RegExp(r'^\(\d\d\d\)-\d\d\d-\d\d-\d\d$');

  @override
  void initState() {
    super.initState();
    _phoneNumber.addListener(() {
      setState(() {
        _phoneText = _phoneNumber.text;
      });
    });
  }

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
            child: SingleChildScrollView(
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
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    autofocus: true,
                    controller: _phoneNumber,
                    keyboardType: TextInputType.number,
                    keyboardAppearance: Brightness.light,
                    inputFormatters: <TextInputFormatter>[
                      // FilteringTextInputFormatter.allow(_phoneExp),
                      LengthLimitingTextInputFormatter(10),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: InputDecoration(
                      prefixText: '  +7  |  ',
                      prefixStyle: const TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                      // label: const Text(''),
                      // labelStyle: const TextStyle(
                      //   fontSize: 19,
                      //   color: Colors.grey,
                      // ),
                      suffixIcon: _phoneNumber.text.isNotEmpty
                          ? IconButton(
                              onPressed: () {
                                setState(() {
                                  _phoneNumber.clear();
                                });
                              },
                              icon: const Icon(Icons.cancel),
                              color: Colors.grey,
                              splashColor: Colors.white,
                              focusColor: Colors.grey,
                            )
                          : null,
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
                  const SizedBox(
                    height: 135,
                  ),
                  OutlinedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blueAccent),
                      fixedSize:
                          MaterialStateProperty.all<Size>(const Size(365, 45)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/');
                    },
                    child: const Text(
                      'Далее',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Нажимая "Далее", вы принимаете Условия использования и Политику конфидециальности сервиса',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
