import 'package:flutter/material.dart';

class EditButtonWidget extends StatelessWidget {
  const EditButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        Navigator.pushNamed(context, '/user_editing');
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'Редактировать',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.blue,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.grey.shade100,
        primary: Colors.white,
        textStyle: const TextStyle(color: Colors.blue),
        fixedSize: const Size(365, 45),
        splashFactory: NoSplash.splashFactory,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 0,
        side: const BorderSide(color: Colors.white),
      ),
      // ButtonStyle(
      //   backgroundColor: MaterialStateProperty.all<Color>(Colors.grey.shade100),
      //   textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(
      //     color: Colors.blue,
      //   )),
      //   fixedSize: MaterialStateProperty.all<Size>(const Size(365, 45)),
      //   splashFactory: NoSplash.splashFactory,
      //   shadowColor: MaterialStateProperty.all<Color>(Colors.white),
      //   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      //     RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(8),
      //     ),
      //   ),
      // ),
    );
  }
}
