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
        backgroundColor: Colors.white,
        body: Form(
          child: SafeArea(
            minimum: const EdgeInsets.all(28.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 175,
                ),
                logoVK,
                const SizedBox(
                  height: 175,
                ),
                OutlinedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green),
                        // padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        //     const EdgeInsets.symmetric(horizontal: 100))
                        fixedSize: MaterialStateProperty.all<Size>(
                            const Size(365, 45)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)))),
                    onPressed: () {
                      Navigator.pushNamed(context, '/registration_screen');
                    },
                    child: const Text(
                      'Зарегистрироваться',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400),
                    )),
                const SizedBox(
                  height: 15,
                ),
                const Text('или с помощью',
                    style: TextStyle(color: Colors.grey, fontSize: 16.0)),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    OutlinedButton(
                      onPressed: () {},
                      child: Image.asset(
                        'assets/images/fbLogo.png',
                        height: 25,
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          fixedSize: MaterialStateProperty.all<Size>(
                              const Size(170, 45)),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)))),
                    ),
                    const SizedBox(width: 15),
                    OutlinedButton(
                      onPressed: () {},
                      child: Image.asset(
                        'assets/images/aplLogo.png',
                        height: 25,
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        fixedSize: MaterialStateProperty.all<Size>(
                            const Size(170, 45)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8))),
                        side: MaterialStateProperty.all<BorderSide>(
                            const BorderSide(width: 0.2, color: Colors.grey)),
                        shadowColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 85,
                ),
                const Text('Уже есть аккаунт?',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                    )),
                const SizedBox(
                  height: 25,
                ),
                OutlinedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blueAccent),
                    // padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    //     const EdgeInsets.symmetric(horizontal: 100))
                    fixedSize:
                        MaterialStateProperty.all<Size>(const Size(365, 45)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/login_screen');
                  },
                  child: const Text(
                    'Войти',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Image logoVK = Image.asset(
  'assets/images/vkLogo.png',
  width: 100,
  height: 100,
  alignment: Alignment.center,
);

// OutlinedButton loginButton = OutlinedButton(
//   style: ButtonStyle(
//     backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
//     // padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
//     //     const EdgeInsets.symmetric(horizontal: 100))
//     fixedSize: MaterialStateProperty.all<Size>(const Size(365, 45)),
//     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//         RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
//   ),
//   onPressed: checkData,
//   child: const Text(
//     'Войти',
//     style: TextStyle(
//         color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w400),
//   ),
// );
