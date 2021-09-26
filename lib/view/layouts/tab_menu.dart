import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
List<Widget> TabMenu(){
  return const <Tab>[
      Tab(
        child: Text('Restaurantes',
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 21.0,
            )),
      ),
      Tab(
        child: Text('Trabalho',
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
      ),
  ];
}