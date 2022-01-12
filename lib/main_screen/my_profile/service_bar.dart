import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class ServiceBarWidget extends StatelessWidget {
  const ServiceBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(LineIcons.camera),
                  color: Colors.blue,
                  splashRadius: 0.1,
                  iconSize: 36.0),
              const Text(
                'История',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 5,
          ),
          Column(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(LineIcons.plusCircle),
                  color: Colors.blue,
                  splashRadius: 0.1,
                  iconSize: 36.0),
              const Text(
                'Запись',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 5,
          ),
          Column(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(LineIcons.image),
                color: Colors.blue,
                splashRadius: 0.1,
                iconSize: 36.0,
              ),
              const Text(
                'Фото',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 5,
          ),
          Column(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(LineIcons.music),
                color: Colors.blue,
                splashRadius: 0.1,
                iconSize: 36.0,
              ),
              const Text(
                'Музыка',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
