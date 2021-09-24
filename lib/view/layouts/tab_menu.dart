import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
List<Widget> TabMenu(){
  return const <Tab>[
    Tab(
        child: Text('Restaurante',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 21.0,
            )),
      ),
      Tab(
        child: Text('Meus Restaurantes',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 21.0,
            )),
      ),
      Tab(
        child: Text('Minha Conta',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 21.0,
            )),
      )
  ];
}