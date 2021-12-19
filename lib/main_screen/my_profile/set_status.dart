import 'package:flutter/material.dart';

class SetStatusWidget extends StatelessWidget {
  const SetStatusWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Установить статус'),
      ),
    );
  }
}
