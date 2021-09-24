import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:free_ticket_system_frontend/view/productpage.dart';
import 'package:free_ticket_system_frontend/view/layouts/tab_menu.dart';

class UserHome extends StatefulWidget {
  const UserHome({Key? key}) : super(key: key);

  @override
  _NewUserHome createState() => _NewUserHome();
}

class _NewUserHome extends State<UserHome>{

  List<Widget> menu = TabMenu();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: menu.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: SizedBox(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Image.asset('assets/images/logo_sem_nome.png'),
                ),
              ),
          actions: [
            IconButton(
              onPressed: (){},
              icon: const Icon(Icons.notifications_none)
            )
          ],
          bottom: TabBar(
            indicatorColor: Colors.transparent,
            labelColor: Colors.red,
            isScrollable: true,
            labelPadding: const EdgeInsets.only(right: 20.0, left: 20.0),
            unselectedLabelColor: const Color(0xFFCDCDCD),
            tabs: menu,
          ),
        ),
        body: const TabBarView(
          children: [
            Center(
              child: ProductPage()
            ),
            Center(
              child: Text("Meus Restaurante")
            ),
            Center(
              child: Text("Minha conta")
            ),
          ]
        )
      ),
    );
  }
}