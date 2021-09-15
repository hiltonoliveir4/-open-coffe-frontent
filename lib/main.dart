import 'package:flutter/material.dart';
import 'package:free_ticket_system_frontend/view/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        '/': (context) => const HomePage(),
        // '/login': (context) => Login(),
        // '/register': (context) => Register(),
      }
    );
  }
}

