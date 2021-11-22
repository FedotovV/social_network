import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:vk_app/items/logos.dart';
import 'package:vk_app/items/phone_number_pattern.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/link.dart';
import 'package:vk_app/items/colors.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _phoneNumber = TextEditingController();
  final _phoneFocus = FocusNode();
  Future<void>? _launched;
  Future<void> _launchInBrowser(String url) async {
    if (!await launch(
      url,
      forceSafariVC: false,
      forceWebView: false,
      headers: <String, String>{'my_header_key': 'my_header_value'},
    )) {
      throw 'Could not launch $url';
    }
  }

  final _phoneExp = RegExp(r'^\(\d\d\d\)-\d\d\d-\d\d-\d\d$');
  static const String urlTermsOfUse = 'https://www.instagram.com/skljkeee52/';
  static const String urlCustomPosition =
      'https://github.com/FedotovV/social_network';

  @override
  void initState() {
    super.initState();
    _phoneNumber.addListener(() {
      setState(() {});
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
                    inputFormatters: [
                      // FilteringTextInputFormatter.allow(_phoneExp),
                      LengthLimitingTextInputFormatter(12),
                      FilteringTextInputFormatter.digitsOnly,
                      // PhoneNumberFormatter(),
                    ],
                    decoration: InputDecoration(
                      prefixText: '  +7  |  ',
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
