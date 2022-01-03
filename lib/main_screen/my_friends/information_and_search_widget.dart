import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 30.0),
      child: Column(
        children: [
          Row(
            children: const [
              CircleAvatar(
                backgroundImage: AssetImage('image/photo/foto.jpg'),
                radius: 18.0,
              ),
              SizedBox(
                width: 115,
              ),
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
          TextFormField(
            decoration: const InputDecoration(
                label: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                hintText: 'Поиск',
                hintStyle: TextStyle(
                  fontSize: 18,
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4.0)))),
          ),
        ],
      ),
    );
  }
}
