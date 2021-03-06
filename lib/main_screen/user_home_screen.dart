import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:vk_app/main_screen/my_profile/avatar_name_info.dart';

import 'my_friends/information_and_search_widget.dart';
import 'my_profile/edit_button.dart';
import 'my_profile/friend_button.dart';
import 'my_profile/friend_list_widget.dart';
import 'my_profile/information_city_and_education_widget.dart';
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
          backgroundColor: Colors.grey.shade50,
          elevation: 0,
          titleTextStyle: const TextStyle(
            color: Colors.blue,
            fontSize: 14,
          ),
          centerTitle: true,
          title: Column(
            children: [
              RichText(
                text: const TextSpan(
                  text: 'id139156936',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              RichText(
                text: const TextSpan(
                  text: 'Указать короткое имя',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: const Icon(LineIcons.qrcode, size: 28, color: Colors.blue),
              onPressed: () {},
              alignment: Alignment.centerRight,
              color: Colors.blue,
              splashColor: Colors.white,
              splashRadius: 0.01,
            ),
          ),
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
              SizedBox(
                height: 15,
              ),
              InformationCityAndEducationWidget(),
              SizedBox(
                height: 15,
              ),
              Divider(
                indent: 26,
                endIndent: 26,
              ),
              FriendButton(),
              FriendListWidget(),
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
              backgroundImage: AssetImage('image/photo/SF.jpg'),
              radius: 8.0,
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
