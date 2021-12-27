import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class MyFriendsScreen extends StatefulWidget {
  const MyFriendsScreen({Key? key}) : super(key: key);

  @override
  _MyFriendsScreenState createState() => _MyFriendsScreenState();
}

buildUserProfile() {
  @required
  String name;
  ImageProvider image;
}

class _MyFriendsScreenState extends State<MyFriendsScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemExtent: 100,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
          ),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.blue[50],
                radius: 40.0,
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
                      'Юлия Рудакова',
                      style: TextStyle(fontSize: 20),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
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
                onPressed: () {},
                icon: const Icon(LineIcons.facebookMessenger),
                color: Colors.blueAccent[400],
                iconSize: 32,
              ),
            ],
          ),
        );
      },
    );
  }
}
