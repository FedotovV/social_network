import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';

class InformationCityAndEducationWidget extends StatelessWidget {
  const InformationCityAndEducationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      // текст "город"
      userPlaceOfResidence(),
      // кнопка "учеба"
      userPlaceOfStudy(),
      // кнопка "работа"
      userPlaceOfWork(),
      // кнопка "подробная информация"
      detailedInformation(),
    ]);
  }

  Padding detailedInformation() {
    return Padding(
      padding: const EdgeInsets.only(left: 7.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: SizedBox(
          width: 365,
          height: 35,
          child: TextButton(
            style: TextButton.styleFrom(
              primary: Colors.white,
            ),
            onPressed: () {},
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(
                  width: 2,
                ),
                Icon(
                  Icons.info_rounded,
                  color: Colors.blue,
                  size: 25,
                ),
                SizedBox(
                  width: 12,
                ),
                Text(
                  'Подробная информация',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding userPlaceOfWork() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 7.0,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: SizedBox(
          width: 365,
          height: 35,
          child: TextButton(
            style: TextButton.styleFrom(
              minimumSize: const Size(50, 0),
              primary: Colors.white,
            ),
            onPressed: () {},
            child: Row(
              children: const [
                SizedBox(
                  width: 2,
                ),
                Icon(
                  LineIcons.briefcase,
                  color: Colors.blue,
                  size: 25,
                ),
                SizedBox(
                  width: 12,
                ),
                Text(
                  'LAD IT',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding userPlaceOfStudy() {
    return Padding(
      padding: const EdgeInsets.only(left: 7.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: SizedBox(
          width: 365,
          height: 35,
          child: TextButton(
            style: TextButton.styleFrom(
              primary: Colors.white,
            ),
            onPressed: () {},
            child: Row(
              children: const [
                SizedBox(
                  width: 2,
                ),
                Icon(
                  LineIcons.graduationCap,
                  color: Colors.blue,
                  size: 25,
                ),
                SizedBox(
                  width: 12,
                ),
                Text(
                  'Правовая Академия',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding userPlaceOfResidence() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 5.0),
      child: Row(
        children: [
          Icon(
            LineIcons.home,
            color: Colors.grey[500],
            size: 25,
          ),
          const SizedBox(
            width: 14,
          ),
          Text(
            'Город: Нижний Новгород',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w400,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }
}
