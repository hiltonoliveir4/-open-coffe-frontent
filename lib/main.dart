import 'package:flutter/material.dart';
import 'package:free_ticket_system_frontend/view/add_funcionario.dart';
import 'package:free_ticket_system_frontend/view/add_produto.dart';
import 'package:free_ticket_system_frontend/view/add_restaurante.dart';
import 'package:free_ticket_system_frontend/view/autenticate.dart';
import 'package:free_ticket_system_frontend/view/autenticate_func.dart';
import 'package:free_ticket_system_frontend/view/edit_produtc.dart';
import 'package:free_ticket_system_frontend/view/edit_restaurant.dart';
import 'package:free_ticket_system_frontend/view/home.dart';
import 'package:free_ticket_system_frontend/view/login.dart';
import 'package:free_ticket_system_frontend/view/register.dart';
import 'package:free_ticket_system_frontend/view/restaurant_page.dart';
import 'package:free_ticket_system_frontend/view/user_home.dart';

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
        '/login': (context) => const Login(),
        '/register': (context) => const Register(),
        '/autenticate': (context) => const Autenticate(),
        '/user-home': (context) => const UserHome(),
        '/add-restaurante': (context) => const AddRestaurante(),
        '/restaurant': (context) => const RestaurantPage(),
        '/edit-restaurant': (context) => const EditRestaurante(),
        '/add-func': (context) => const AddFuncionario(),
        '/add-produto': (context) => const AddProduto(),
        '/edit-product': (context) => const EditProduct(),
        '/autenticate-func': (context) => const AutenticateFunc(),
      }
    );
  }
}

