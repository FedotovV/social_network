import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: const EdgeInsets.only(left: 16.0, bottom: 36.0, right: 16.0),
        color: Colors.blue,
        child: ListView(
          children: <Widget>[
            const SizedBox(
              height: 100,
            ),
            buildMenuItem(
              text: 'Редактировать профиль',
              icon: Icons.edit,
            ),
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
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
  }) {
    const color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: const TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: () {},
    );
  }
}
