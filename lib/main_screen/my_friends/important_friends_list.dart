import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class ImportantFriendsList extends StatefulWidget {
  const ImportantFriendsList({Key? key}) : super(key: key);

  @override
  _ImportantFriendsListState createState() => _ImportantFriendsListState();
}

buildUserProfile() {
  @required
  String name;
  ImageProvider image;
}

class _ImportantFriendsListState extends State<ImportantFriendsList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemExtent: 90,
      itemBuilder: (BuildContext context, int index) {
        return Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.blue[50],
                    radius: 40.0,
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
                          style: TextStyle(fontSize: 20),
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
            ),
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
}
