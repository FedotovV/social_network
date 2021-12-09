import 'package:flutter/material.dart';

abstract class NumberPhone {
  static Widget numberPhone = const Text(
    'Ваш номер телефона будет использоваться для входа в аккаунт',
    textAlign: TextAlign.center,
    style: TextStyle(
      color: Colors.grey,
      fontSize: 15,
    ),
  );
}
