import 'package:flutter/material.dart';

class UserEditing extends StatelessWidget {
  const UserEditing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Редактирование пользователя',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
