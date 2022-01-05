import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:line_icons/line_icons.dart';

class InformationAndSearchWidget extends StatefulWidget {
  const InformationAndSearchWidget({Key? key}) : super(key: key);

  @override
  _InformationAndSearchWidgetState createState() =>
      _InformationAndSearchWidgetState();
}

class _InformationAndSearchWidgetState
    extends State<InformationAndSearchWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          children: [
            // Виджет поиска
            TextFormField(
              cursorColor: Colors.black,
              cursorHeight: 16,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(
                    left: 14, right: 3, top: 10, bottom: 10),
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
            ),
            const SizedBox(
              height: 20,
            ),
            // Кнопки "Сканировать QR" и "Добавить друга"
            Row(
              children: [
                // кнопка "Сканировать QR"
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    fixedSize: const Size(185, 45),
                    side: BorderSide(color: Colors.grey.shade300),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
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
                ),
                const SizedBox(
                  width: 10,
                ),
                // Кнопка "добавить друга"
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    fixedSize: const Size(185, 45),
                    side: BorderSide(color: Colors.grey.shade300),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
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
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            // Текст "Важные"
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Важные',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            // Список "Важных друзей"
            ListView.builder(
              itemCount: 5,
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
                          radius: 40.0,
                          // Передавать информацию через API
                          backgroundImage:
                              const AssetImage('image/photo/foto.jpg'),
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
                                style:
                                    TextStyle(fontSize: 16, color: Colors.grey),
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
            ),
            const SizedBox(
              height: 15,
            ),
            // Текст "Мои друзья"
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Мои друзья',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            // Список друзей
            ListView.builder(
              // Передавать зависимость от количества друзей .длина
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
                          radius: 40.0,
                          // Передавать информацию через API
                          backgroundImage:
                              const AssetImage('image/photo/foto.jpg'),
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
                                style:
                                    TextStyle(fontSize: 16, color: Colors.grey),
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
            ),
          ],
        ),
      ),
    );
  }
}
