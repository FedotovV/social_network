import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_icons/line_icons.dart';
import 'package:pattern_formatter/pattern_formatter.dart';
import 'package:vk_app/items/logos.dart';

class UserRegistrationScreen extends StatefulWidget {
  const UserRegistrationScreen({Key? key}) : super(key: key);

  @override
  _UserRegistrationScreenState createState() => _UserRegistrationScreenState();
}

class _UserRegistrationScreenState extends State<UserRegistrationScreen> {
  final _userFirstName = TextEditingController();
  final _userLastName = TextEditingController();
  final _dateOfBirth = TextEditingController();
  final _cityResidence = TextEditingController();

  @override
  void dispose() {
    _userFirstName.dispose();
    _userLastName.dispose();
    _dateOfBirth.dispose();
    _cityResidence.dispose();
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
    _dateOfBirth.addListener(() {
      setState(() {});
    });
    _cityResidence.addListener(() {
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

  String? _validationDateOfBirth(value) {
    if (value.isEmpty) {
      return 'Заполните дату вашего рождения';
    } else if (value <= 01 / 01 / 2016) {
      return 'Вы не можете самостоятельно зарегистироваться, возраст менее 5 лет';
    } else {
      return null;
    }
  }

  String? _validationCityResidence(value) {
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
          backgroundColor: Colors.blueAccent,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _userNameKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 75,
                  ),
                  Logos.logoVK,
                  const SizedBox(
                    height: 50,
                  ),

                  // Виджет с текстом "для регистрации нового профиля..."
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
                  // Поле для ввода "Введите имя"
                  TextFormField(
                    cursorColor: Colors.black,
                    validator: _validationUserFirstName,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                    controller: _userFirstName,
                    decoration: InputDecoration(
                      suffixIcon: _userFirstName.text.isNotEmpty
                          ? IconButton(
                              color: Colors.grey,
                              onPressed: () {
                                setState(() {
                                  _userFirstName.clear();
                                });
                              },
                              icon: const Icon(Icons.cancel))
                          : null,
                      prefixIcon: const Icon(
                        LineIcons.user,
                        color: Colors.grey,
                      ),
                      hintText: 'Введите имя',
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(
                          16.0,
                        )),
                        gapPadding: 4.0,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(
                          16.0,
                        )),
                        gapPadding: 4.0,
                      ),
                      focusColor: Colors.white,
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      hoverColor: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // поле ввода "Введите фамилию"
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
                              color: Colors.grey,
                              onPressed: () {
                                setState(() {
                                  _userLastName.clear();
                                });
                              },
                              icon: const Icon(Icons.cancel))
                          : null,
                      prefixIcon: const Icon(
                        LineIcons.userCheck,
                        color: Colors.grey,
                      ),
                      hintText: 'Введите фамилию',
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(
                          16.0,
                        )),
                        gapPadding: 4.0,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(
                          16.0,
                        )),
                        gapPadding: 4.0,
                      ),
                      focusColor: Colors.white,
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      hoverColor: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // поле ввода "Введите дату рождения"
                  TextFormField(
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      DateInputFormatter(),
                    ],
                    validator: _validationDateOfBirth,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                    controller: _dateOfBirth,
                    decoration: InputDecoration(
                      suffixIcon: _userLastName.text.isNotEmpty
                          ? IconButton(
                              color: Colors.grey,
                              onPressed: () {
                                setState(() {
                                  _userLastName.clear();
                                });
                              },
                              icon: const Icon(Icons.cancel))
                          : null,
                      prefixIcon: const Icon(
                        LineIcons.calendar,
                        color: Colors.grey,
                      ),
                      hintText: 'Введите дату рождения',
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(
                          16.0,
                        )),
                        gapPadding: 4.0,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(
                          16.0,
                        )),
                        gapPadding: 4.0,
                      ),
                      focusColor: Colors.white,
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      hoverColor: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // поле ввода "Введите фамилию"
                  TextFormField(
                    validator: _validationCityResidence,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                    controller: _cityResidence,
                    decoration: InputDecoration(
                      suffixIcon: _userLastName.text.isNotEmpty
                          ? IconButton(
                              color: Colors.grey,
                              onPressed: () {
                                setState(() {
                                  _userLastName.clear();
                                });
                              },
                              icon: const Icon(Icons.cancel))
                          : null,
                      prefixIcon: const Icon(
                        LineIcons.city,
                        color: Colors.grey,
                      ),
                      hintText: 'Введите город проживание',
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(
                          16.0,
                        )),
                        gapPadding: 4.0,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(
                          16.0,
                        )),
                        gapPadding: 4.0,
                      ),
                      focusColor: Colors.white,
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      hoverColor: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
