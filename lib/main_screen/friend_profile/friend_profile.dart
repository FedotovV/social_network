import 'package:flutter/material.dart';

class FriendProfile extends StatelessWidget {
  const FriendProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Профиль друга'),
      ),
    );
  }
}
