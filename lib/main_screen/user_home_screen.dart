import 'package:flutter/material.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({Key? key}) : super(key: key);

  @override
  _UserHomeScreenState createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  static const List<Widget> _widgetOptions = <Widget>[
    Center(
      child: Text(
        'Моя страница',
        style: TextStyle(fontSize: 40),
      ),
    ),
    Center(
      child: Text(
        'Мои друзья',
        style: TextStyle(fontSize: 40),
      ),
    ),
    Center(
      child: Text(
        'Мои сообщения',
        style: TextStyle(fontSize: 40),
      ),
    ),
    Center(
      child: Text(
        'Моя музыка',
        style: TextStyle(fontSize: 40),
      ),
    ),
  ];

  int _currentTab = 0;

  void currentIndexScreen(int index) {
    setState(() {
      _currentTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions[_currentTab],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        // type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.grey,
        unselectedItemColor: Colors.grey,
        iconSize: 28,
        selectedFontSize: 16,
        unselectedFontSize: 16,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Мой профиль',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Друзья',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Сообщения',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note),
            label: 'Музыка',
            backgroundColor: Colors.white,
          ),
        ],
        onTap: currentIndexScreen,
      ),
    );
  }
}
