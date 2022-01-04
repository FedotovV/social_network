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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30.0),
      child: Column(
        children: [
          // Аватар + "Друзья"
          Row(
            // Аватар
            children: const [
              CircleAvatar(
                backgroundImage: AssetImage('image/photo/foto.jpg'),
                radius: 18.0,
              ),
              SizedBox(
                width: 100,
              ),
              // "Друзья"
              Text(
                'Друзья',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
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
        ],
      ),
    );
  }
}
