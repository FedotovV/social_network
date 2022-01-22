import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AvatarNameInfo extends StatelessWidget {
  const AvatarNameInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage('image/photo/SF.jpg'),
            radius: 60.0,
          ),
          const SizedBox(
            width: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Fedotov Vyacheslav',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 7,
              ),
              RichText(
                text: TextSpan(
                  text: 'Установите статус',
                  style: const TextStyle(color: Colors.blue, fontSize: 17),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pushNamed(context, '/set_status_profile');
                    },
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              Row(
                children: const [
                  Text(
                    'online',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.phone_android,
                    size: 12,
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
