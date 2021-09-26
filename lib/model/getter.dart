import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:free_ticket_system_frontend/view/layouts/show_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Getter{
  final String baseurl = "http://localhost:3000";
  
  Future getMeuRestaurantes (BuildContext context) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // ignore: await_only_futures
    var token = await prefs.getString('token');
    List lanchonetes;
    try{
      var response = await Dio().get('$baseurl/lanchonete/byowner', options: Options(
          headers: {'Authorization': 'Bearer $token'}
        )
      );

      if(response.statusCode == 200){
        lanchonetes = response.data['lanchonetes'];
        return lanchonetes;
      }

    } on DioError catch (e){
      if (e.response != null){
        showMyDialog("Erro", e.response.toString(), context);
      } else {
        // ignore: avoid_print
        print(e);
      }
    }
  }
}