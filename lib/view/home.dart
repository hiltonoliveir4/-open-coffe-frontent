import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFEDA412),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 220,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('images/logo.png'),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.all(
                    Radius.circular(40.0),
                  )),
              width: 220.0,
              height: 45.0,
              margin: const EdgeInsets.all(10.0),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: TextButton(
                  child: const Text(
                    "LOGIN",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.all(
                    Radius.circular(40.0),
                  )),
              width: 220.0,
              height: 45.0,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: TextButton(
                  child: const Text(
                    "CADASTRE-SE",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}