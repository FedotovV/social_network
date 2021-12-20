import 'package:flutter/material.dart';

class ServiceBarWidget extends StatelessWidget {
  const ServiceBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.photo),
            color: Colors.blue,
            splashRadius: 0.1),
        const SizedBox(
          width: 5,
        ),
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.photo),
            color: Colors.blue,
            splashRadius: 0.1),
        const SizedBox(
          width: 5,
        ),
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.photo),
            color: Colors.blue,
            splashRadius: 0.1),
        const SizedBox(
          width: 5,
        ),
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.photo),
            color: Colors.blue,
            splashRadius: 0.1),
      ],
    );
  }
}
