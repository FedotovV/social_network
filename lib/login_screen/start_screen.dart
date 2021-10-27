import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: Scaffold(
        body: Form(
          child: SafeArea(
            minimum: const EdgeInsets.all(32.0),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/VK.png',
                  width: 80,
                  height: 80,
                  alignment: Alignment.center,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green),
                        // padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        //     const EdgeInsets.symmetric(horizontal: 100))
                        fixedSize: MaterialStateProperty.all<Size>(
                            const Size(365, 16))),
                    onPressed: () {},
                    child: const Text(
                      'Зарегистрироваться',
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
