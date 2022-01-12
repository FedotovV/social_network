import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:vk_app/main_screen/my_profile/avatar_name_info.dart';

import 'my_friends/important_friends_list.dart';
import 'my_friends/information_and_search_widget.dart';
import 'my_profile/edit_button.dart';
import 'my_profile/service_bar.dart';
import 'navigation_drawer.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({Key? key}) : super(key: key);

  @override
  _UserHomeScreenState createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  // ignore: prefer_final_fields
  static List<Widget> _widgetOptions = <Widget>[
    // Мой профиль
    Scaffold(
        drawer: const NavigationDrawer(),
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: const Text('Профиль'),
          centerTitle: true,
          // leading: IconButton(
          //   icon: const Icon(Icons.menu),
          //   onPressed: () {},
          //   alignment: Alignment.center,
          // ),
        ),
        body: SingleChildScrollView(
          child: Container(
              child: Column(
            children: const [
              AvatarNameInfo(),
              SizedBox(
                height: 5,
              ),
              EditButtonWidget(),
              SizedBox(
                height: 15,
              ),
              ServiceBarWidget(),
              SizedBox(
                height: 15,
              ),
              Divider(
                indent: 26,
                endIndent: 26,
              ),
            ],
          )),
        )),
    // Мои друзья
    Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.shade50,
        elevation: 0,
        centerTitle: true,
        leading: const InkWell(
          // реализовать обработку нажатия на аватарку
          // onTap: () {Navigator.pushNamed(context, '/user_home');},
          child: Padding(
            padding: EdgeInsets.only(left: 18.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('image/photo/foto.jpg'),
              radius: 6.0,
            ),
          ),
        ),
        title: const Text(
          'Друзья',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            InformationAndSearchWidget(),
          ],
        ),
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
                    LineIcons.home,
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
