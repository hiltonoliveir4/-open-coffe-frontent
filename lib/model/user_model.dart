import 'package:flutter/material.dart';

// ignore: todo
//TODO: VER COM PABLO O QUE PRECISA PRA UM FUNCIONÁRIO DURANTE A SEMANA

class Usuario{
  final int? id;
  final String? name;
  final String? email;
  final bool? isAdmin;
  final String? createdAt;
  final String? updatedAt;
  final String? token;

  Usuario({
    @required this.id,
    @required this.name,
    @required this.email,
    @required this.isAdmin,
    @required this.createdAt,
    @required this.updatedAt,
    @required this.token
  });

  @override
  String toString() {
    return '$name';
  }
}