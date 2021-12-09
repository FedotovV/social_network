import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import 'navigation_drawer.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({Key? key}) : super(key: key);

  @override
  _UserHomeScreenState createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  // ignore: prefer_final_fields
  static List<Widget> _widgetOptions = <Widget>[
    Scaffold(
      drawer: const NavigationDrawer(),
      appBar: AppBar(
        title: const Text('Профиль'),
        centerTitle: true,
        // leading: IconButton(
        //   icon: const Icon(Icons.menu),
        //   onPressed: () {},
        //   alignment: Alignment.center,
        // ),
      ),
    ),
    const Center(
      child: Text(
        'Мои друзья',
        style: TextStyle(fontSize: 40),
      ),
    ),
    const Center(
      child: Text(
        'Мои сообщения',
        style: TextStyle(fontSize: 40),
      ),
    ),
    const Center(
      child: Text(
        'Мои сообщества',
        style: TextStyle(fontSize: 40),
      ),
    ),
    const Center(
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
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: _widgetOptions[_currentTab],
        ),
        bottomNavigationBar: Container(
          height: 100.0,
          color: Colors.white,
          padding: const EdgeInsets.only(top: 20.0),
          child: Theme(
            data: ThemeData.light(),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: _currentTab,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    LineIcons.userCircle,
                    size: 30,
                  ),
                  label: '',
                  backgroundColor: Colors.grey,
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    LineIcons.userFriends,
                    size: 30,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    LineIcons.sms,
                    size: 30,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    LineIcons.handshake,
                    size: 30,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    LineIcons.music,
                    size: 30,
                  ),
                  label: '',
                ),
              ],
              onTap: currentIndexScreen,
            ),
          ),
        ),
      ),
    );
  }
}
