import 'package:flutter/material.dart';

class FriendButton extends StatelessWidget {
  const FriendButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        primary: Colors.white,
        splashFactory: NoSplash.splashFactory,
      ),
      onPressed: () {
        // необходимо реализовать переход на вкладку "Друзья (2-ой таб)"
        // Navigator.pushNamed(context, '/');
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          children: [
            RichText(
              text: const TextSpan(
                  text: 'ДРУЗЬЯ ',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                        text: ' 9',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        )),
                  ]),
            ),
            const SizedBox(
              width: 250,
            ),
            Icon(Icons.keyboard_arrow_right, color: Colors.grey[400], size: 27),
          ],
        ),
      ),
    );
  }
}
