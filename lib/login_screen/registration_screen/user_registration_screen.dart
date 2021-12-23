import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class UserRegistrationScreen extends StatefulWidget {
  const UserRegistrationScreen({Key? key}) : super(key: key);

  @override
  _UserRegistrationScreenState createState() => _UserRegistrationScreenState();
}

class _UserRegistrationScreenState extends State<UserRegistrationScreen> {
  final _userFirstName = TextEditingController();
  final _userLastName = TextEditingController();

  @override
  void dispose() {
    _userFirstName.dispose();
    _userLastName.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _userFirstName.addListener(() {
      setState(() {});
    });
    _userLastName.addListener(() {
      setState(() {});
    });
  }

  String? _validationUserFirstName(value) {
    if (value.isEmpty) {
      return 'Поле не может быть пустым';
    } else if (value < 3) {
      return 'Имя не может быть меньше 3-х символов';
    } else {
      return null;
    }
  }

  String? _validationUserLastName(value) {
    if (value.isEmpty) {
      return 'Поле не может быть пустым';
    } else if (value < 3) {
      return 'Имя не может быть меньше 3-х символов';
    } else if (value == _userFirstName) {
      return 'Фамилия не может совпадать с именем';
    } else {
      return null;
    }
  }

  final _userNameKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Регистрация'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _userNameKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Для регистрации нового профиля, заполните поля указанные ниже.',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    validator: _validationUserFirstName,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                    controller: _userFirstName,
                    decoration: InputDecoration(
                      suffixIcon: _userFirstName.text.isNotEmpty
                          ? IconButton(
                              onPressed: () {
                                setState(() {
                                  _userFirstName.clear();
                                });
                              },
                              icon: const Icon(Icons.cancel))
                          : null,
                      prefixIcon: const Icon(LineIcons.user),
                      hintText: 'Введите имя',
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(
                          8.0,
                        )),
                        gapPadding: 4.0,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(
                          8.0,
                        )),
                        gapPadding: 4.0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    validator: _validationUserLastName,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                    controller: _userLastName,
                    decoration: InputDecoration(
                      suffixIcon: _userLastName.text.isNotEmpty
                          ? IconButton(
                              onPressed: () {
                                setState(() {
                                  _userLastName.clear();
                                });
                              },
                              icon: const Icon(Icons.cancel))
                          : null,
                      prefixIcon: const Icon(LineIcons.user),
                      hintText: 'Введите фамилию',
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(
                          8.0,
                        )),
                        gapPadding: 4.0,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(
                          8.0,
                        )),
                        gapPadding: 4.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
