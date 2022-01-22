import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:line_icons/line_icons.dart';

class Profile {
  final AssetImage imageName;
  final String userName;
  final String city;

  Profile(
      {required this.imageName, required this.userName, required this.city});
}

class InformationAndSearchWidget extends StatefulWidget {
  const InformationAndSearchWidget({Key? key}) : super(key: key);

  @override
  _InformationAndSearchWidgetState createState() =>
      _InformationAndSearchWidgetState();
}

final _searchController = TextEditingController();

final _profile = [
  Profile(
      imageName: const AssetImage('image/photo/foto.jpg'),
      userName: 'Юлия Рудакова',
      city: 'Нижний Новгород'),
  Profile(
      imageName: const AssetImage('image/photo/DY.jpg'),
      userName: 'Дмитрий Юлин',
      city: 'Нижний Новгород'),
  Profile(
      imageName: const AssetImage('image/photo/YN.jpg'),
      userName: 'Юрий Никуленков',
      city: 'Нижний Новгород'),
  Profile(
      imageName: const AssetImage('image/photo/SK.jpg'),
      userName: 'Сергей Козлов',
      city: 'Нижний Новгород'),
  Profile(
      imageName: const AssetImage('image/photo/AO.jpg'),
      userName: 'Александр Осинин',
      city: 'Нижний Новгород'),
];

var _filterProrile = <Profile>[];

class _InformationAndSearchWidgetState
    extends State<InformationAndSearchWidget> {
  void _searchProfile() {
    if (_searchController.text.isNotEmpty) {
      _filterProrile = _profile.where((Profile profile) {
        return profile.userName
            .toLowerCase()
            .contains(_searchController.text.toLowerCase());
      }).toList();
    } else {
      _filterProrile = _profile;
    }
    setState(() {});
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _filterProrile = _profile;
    _searchController.addListener(_searchProfile);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          children: [
            // Виджет поиска
            searchWidget(),
            const SizedBox(
              height: 20,
            ),
            // Кнопки "Сканировать QR" и "Добавить друга"
            Row(
              children: [
                // кнопка "Сканировать QR"
                buttonScanQR(),
                const SizedBox(
                  width: 10,
                ),
                // Кнопка "добавить друга"
                buttonAddFriend(),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            // Текст "Важные"
            textImportant(),
            const SizedBox(
              height: 15,
            ),
            // Список "Важных друзей"
            listImportantFriends(),
            const SizedBox(
              height: 15,
            ),
            // Текст "Мои друзья"
            textMyFriends(),
            const SizedBox(
              height: 15,
            ),
            // Список друзей
            listMyFriends(),
          ],
        ),
      ),
    );
  }

  ListView listMyFriends() {
    return ListView.builder(
      // Передавать зависимость от количества друзей .длина
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      itemCount: 15,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemExtent: 85,
      itemBuilder: (BuildContext context, int index) {
        return Stack(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blue[50],
                  radius: 35.0,
                  // Передавать информацию через API
                  backgroundImage: const AssetImage('image/photo/foto.jpg'),
                ),
                const SizedBox(
                  width: 15,
                ),
                Container(
                  width: 175,
                  height: 75,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        // Передавать информацию через API
                        'Юлия Рудакова',
                        style: TextStyle(fontSize: 18),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        // Передавать информацию через API
                        'Нижний Новгород',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(LineIcons.phone),
                  color: Colors.blueAccent[400],
                  iconSize: 32,
                ),
                IconButton(
                  onPressed: () {
                    // Добавить переход в чат
                    Navigator.pushNamed(context, '/user_home');
                  },
                  icon: const Icon(LineIcons.envelope),
                  color: Colors.blueAccent[400],
                  iconSize: 32,
                ),
              ],
            ),
            // обработка нажатия на профиль
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/friend_profile');
              },
            ),
          ],
        );
      },
    );
  }

  Align textMyFriends() {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Мои друзья',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  ListView listImportantFriends() {
    return ListView.builder(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      itemCount: _filterProrile.length,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemExtent: 85,
      itemBuilder: (BuildContext context, int index) {
        final profile = _filterProrile[index];
        return Stack(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blue[50],
                  radius: 35.0,
                  // Передавать информацию через API
                  backgroundImage: profile.imageName,
                ),
                const SizedBox(
                  width: 15,
                ),
                Container(
                  width: 175,
                  height: 75,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        // Передавать информацию через API
                        profile.userName,
                        style: const TextStyle(fontSize: 18),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        // Передавать информацию через API
                        profile.city,
                        style:
                            const TextStyle(fontSize: 16, color: Colors.grey),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(LineIcons.phone),
                  color: Colors.blue,
                  iconSize: 32,
                ),
                IconButton(
                  onPressed: () {
                    // Добавить переход в чат
                    Navigator.pushNamed(context, '/user_home');
                  },
                  icon: const Icon(LineIcons.envelope),
                  color: Colors.blue,
                  iconSize: 32,
                ),
              ],
            ),
            // обработка нажатия на профиль
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/friend_profile');
              },
            ),
          ],
        );
      },
    );
  }

  Align textImportant() {
    return const Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Важные',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  OutlinedButton buttonAddFriend() {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        fixedSize: const Size(185, 45),
        side: BorderSide(color: Colors.grey.shade300),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        primary: Colors.grey.shade300,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          Icon(
            LineIcons.userPlus,
            size: 28,
            color: Colors.blue,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'Добавить друга',
            style: TextStyle(
                fontSize: 14, color: Colors.black, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }

  OutlinedButton buttonScanQR() {
    return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        fixedSize: const Size(185, 45),
        side: BorderSide(color: Colors.grey.shade300),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        primary: Colors.grey.shade300,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          Icon(LineIcons.qrcode, size: 28, color: Colors.blue),
          SizedBox(
            width: 7,
          ),
          Text(
            'Сканировать QR',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  TextFormField searchWidget() {
    return TextFormField(
      controller: _searchController,
      cursorColor: Colors.black,
      cursorHeight: 16,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.only(left: 14, right: 3, top: 10, bottom: 10),
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.grey,
          size: 22,
        ),
        hintText: 'Поиск',
        hintStyle: const TextStyle(
          fontSize: 18,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.all(
            Radius.circular(14.0),
          ),
          gapPadding: 0.5,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.all(
            Radius.circular(14.0),
          ),
          gapPadding: 0.5,
        ),
        focusColor: Colors.white,
        fillColor: Colors.grey.shade200,
        filled: true,
        hoverColor: Colors.white,
      ),
    );
  }
}
