import 'package:flutter/material.dart';
import 'package:vk_app/login_screen/user_editing_screen/user_profile.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String name = 'Vyacheslav Fedotov';
    String email = 'fedotov95152@gmail.com';
    String url = 'image/photo/SF.jpg';

    return Drawer(
      child: Material(
        color: Colors.blue,
        child: ListView(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(left: 10),
              child: userInfoWidget(
                  name: name,
                  email: email,
                  urlImage: url,
                  onClick: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) =>
                              UserProfile(name: name, urlImage: url)),
                    );
                  }),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  const Divider(color: Colors.white70),
                  const SizedBox(
                    height: 16,
                  ),
                  buildMenuItem(
                      text: 'Редактировать профиль',
                      icon: Icons.edit,
                      onClick: () {
                        Navigator.pushNamed(context, '/user_editing');
                      }),
                  buildMenuItem(
                    text: 'Мои фотографии',
                    icon: Icons.photo,
                  ),
                  buildMenuItem(
                    text: 'Моя музыка',
                    icon: Icons.music_note,
                  ),
                  buildMenuItem(
                    text: 'Избранное',
                    icon: Icons.favorite,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Divider(color: Colors.white70),
                  const SizedBox(
                    height: 16,
                  ),
                  buildMenuItem(
                    text: 'Настройка',
                    icon: Icons.settings,
                  ),
                  buildMenuItem(
                      text: 'Выйти из профиля',
                      icon: Icons.exit_to_app,
                      onClick: () {
                        Navigator.pushNamed(context, '/start_screen');
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClick,
  }) {
    const color = Colors.white;
    const hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text,
          style: const TextStyle(
            color: color,
            fontSize: 15,
          )),
      hoverColor: hoverColor,
      onTap: onClick,
    );
  }

  Widget userInfoWidget({
    required String name,
    required String email,
    required String urlImage,
    VoidCallback? onClick,
  }) {
    const color = Colors.white;

    return InkWell(
      onTap: onClick,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(urlImage),
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(name,
                    style: const TextStyle(
                        color: color,
                        fontSize: 16,
                        fontWeight: FontWeight.w700)),
                Text(email,
                    style: const TextStyle(
                        color: color,
                        fontSize: 14,
                        fontWeight: FontWeight.w700)),
              ],
            ),
            // const Spacer(),
            // IconButton(
            //   icon: const Icon(
            //     Icons.add_a_photo_sharp,
            //   ),
            //   onPressed: () {},
            //   color: Colors.white,
            // ),
          ],
        ),
      ),
    );
  }
}
