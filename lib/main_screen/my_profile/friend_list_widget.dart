import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

class FriendListWidget extends StatefulWidget {
  const FriendListWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<FriendListWidget> createState() => _FriendListWidgetState();
}

final List<FriendList> _friendList = [
  FriendList(
    imageName: const AssetImage('image/photo/foto.jpg'),
    userFirstName: 'Юлия',
    userLastName: 'Рудакова',
    city: 'Нижний Новгород',
  ),
  FriendList(
      imageName: const AssetImage('image/photo/DY.jpg'),
      userFirstName: 'Дмитрий',
      userLastName: 'Юлин',
      city: 'Нижний Новгород'),
  FriendList(
      imageName: const AssetImage('image/photo/YN.jpg'),
      userFirstName: 'Юрий',
      userLastName: 'Никуленков',
      city: 'Нижний Новгород'),
  FriendList(
      imageName: const AssetImage('image/photo/SK.jpg'),
      userFirstName: 'Сергей',
      userLastName: 'Козлов',
      city: 'Нижний Новгород'),
  FriendList(
      imageName: const AssetImage('image/photo/AO.jpg'),
      userFirstName: 'Александр',
      userLastName: 'Осинин',
      city: 'Нижний Новгород'),
  FriendList(
      imageName: const AssetImage('image/photo/AF.jpg'),
      userFirstName: 'Александр',
      userLastName: 'Федотов',
      city: 'Нижний Новгород'),
  FriendList(
      imageName: const AssetImage('image/photo/MP.jpg'),
      userFirstName: 'Мария',
      userLastName: 'Парамонова',
      city: 'Нижний Новгород'),
  FriendList(
      imageName: const AssetImage('image/photo/OO.jpg'),
      userFirstName: 'Ольга',
      userLastName: 'Осинина',
      city: 'Нижний Новгород'),
  FriendList(
      imageName: const AssetImage('image/photo/VF.jpg'),
      userFirstName: 'Вера',
      userLastName: 'Федотова',
      city: 'Нижний Новгород'),
];

class _FriendListWidgetState extends State<FriendListWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      // Необходимо заменить способ, стоит заглушка, которая сплешит всю
      // строку друзей (считает как один профиль и обратабыват целую строку)
      onTap: () {
        Navigator.pushNamed(context, '/friend_profile');
      },
      splashFactory: NoSplash.splashFactory,
      child: Container(
        margin: const EdgeInsets.all(8.0),
        height: 150,
        width: 385,
        child: ListView.builder(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            itemCount: _friendList.length,
            itemExtent: 90,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              final friendList = _friendList[index];
              return Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.blue[50],
                    radius: 35.0,
                    // Передавать информацию через API
                    backgroundImage: friendList.imageName,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    friendList.userFirstName,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    friendList.userLastName,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}

class FriendList {
  final AssetImage imageName;
  final String userFirstName;
  final String city;
  final String userLastName;

  FriendList({
    required this.imageName,
    required this.userFirstName,
    required this.userLastName,
    required this.city,
  });
}
