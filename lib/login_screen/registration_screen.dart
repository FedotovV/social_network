import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:vk_app/items/logos.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _phoneNumber = TextEditingController();
  final _phoneFocus = FocusNode();

  static const String urlTermsOfUse = 'https://www.instagram.com/skljkeee52/';
  static const String urlCustomPosition =
      'https://github.com/FedotovV/social_network';

  bool _isButtonActive = true;

  @override
  void initState() {
    super.initState();
    _phoneNumber.addListener(() {
      final _isButtonActive = _phoneNumber.text.isNotEmpty;
      setState(() {
        this._isButtonActive = _isButtonActive;
      });
    });

    PhoneInputFormatter.replacePhoneMask(
        countryCode: 'RU', newMask: '+0 (000)-000 00 00');
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
                    style: const TextStyle(fontSize: 18.0),
                    autofocus: true,
                    controller: _phoneNumber,
                    keyboardType: TextInputType.phone,
                    keyboardAppearance: Brightness.light,
                    inputFormatters: [
                      PhoneInputFormatter(),
                    ],
                    decoration: InputDecoration(
                      prefixText: '  ',
                      prefixIcon: const Icon(
                        Icons.phone,
                        color: Colors.grey,
                      ),
                      prefixStyle: const TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
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
                      if (_isButtonActive) {
                        setState(() {
                          _isButtonActive = true;
                        });
                      } else {
                        return null;
                      }
                      Navigator.pushNamed(context, '/start_screen');
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
                    height: 20,
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                      children: [
                        const TextSpan(
                          text: 'Нажимая «‎Далее»‎, вы принимаете ',
                        ),
                        TextSpan(
                            text: 'Условия использования',
                            style: const TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                if (await canLaunch(urlTermsOfUse)) {
                                  await launch(urlTermsOfUse);
                                } else {
                                  throw 'Страница отсутствует $urlTermsOfUse';
                                }
                              }),
                        const TextSpan(
                          text: ' и ',
                        ),
                        TextSpan(
                            text: 'Политика конфиденциальности',
                            style: const TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                if (await canLaunch(urlCustomPosition)) {
                                  await launch(urlCustomPosition);
                                } else {
                                  throw 'Страница отсутствует $urlCustomPosition';
                                }
                              }),
                        const TextSpan(
                          text: ' сервиса',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
