import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:free_ticket_system_frontend/view/layouts/show_dialog.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Getter{
  final String baseurl = "http://ec2-3-85-228-15.compute-1.amazonaws.com:3000";
  
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

  Future getProducts(String id, BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // ignore: await_only_futures
    var token = await prefs.getString('token');
    try{
      var response = await Dio().get('$baseurl/produto/by_lanchonete/$id', options: Options(
          headers: {'Authorization': 'Bearer $token'}
        )
      );
      if(response.statusCode == 200){
        return response.data;
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

  Future getProduct(String id, BuildContext context) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // ignore: await_only_futures
    var token = await prefs.getString('token');

    try{
      var response = await Dio().get('$baseurl/produto/$id', options: Options(
          headers: {'Authorization': 'Bearer $token'}
        )
      );
      if(response.statusCode == 200){
        return response.data[0];
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

  Future getRestaurantById(String id, BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // ignore: await_only_futures
    var token = await prefs.getString('token');
    try{
      var response = await Dio().get('$baseurl/lanchonete/$id', options: Options(
          headers: {'Authorization': 'Bearer $token'}
        )
      );
      if(response.statusCode == 200){
        if(response.data != null){
          return response.data;
        }
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

  Future getFullRestaurant(String id, BuildContext context) async {
    try{
      var restaurant = await getRestaurantById(id, context);
      List produtos = await getProducts(id, context);

      Map <String, dynamic> response = {
        'restaurante': restaurant,
        'produtos': produtos
      };
      return response;
    } on DioError catch (e){
      if (e.response != null){
        showMyDialog("Erro", e.response.toString(), context);
      } else {
        // ignore: avoid_print
        print(e);
      }
    }
  }

  Future getMeuTrabalho (BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // ignore: await_only_futures
    var token = await prefs.getString('token');
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token.toString());
    var id = decodedToken["id"];
    try{
      var response = await Dio().get('$baseurl/lanchonete/byfunc/$id', options: Options(
          headers: {'Authorization': 'Bearer $token'}
        )
      );
      var verificado = await getFuncLine(context);
      if(verificado['confirmed']){
        var idRestaurante = response.data['lanchonete']['id'];
        var response2 = await Dio().get('$baseurl/produto/by_lanchonete/$idRestaurante', options: Options(
            headers: {'Authorization': 'Bearer $token'}
          )
        );
        List produtos = response2.data;
        return produtos;
      }
      if(!verificado['confirmed']){
        return [];
      }

    } on DioError catch (e){
      if (e.response != null){
        // ignore: avoid_print
        return [500];
      } else {
        // ignore: avoid_print
        print(e);
      }
    }
  }

  getFuncLine(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // ignore: await_only_futures
    var token = await prefs.getString('token');
    try{
      var response = await Dio().get('$baseurl/funcionario/byfunc', options: Options(
          headers: {'Authorization': 'Bearer $token'}
        )
      );

      if(response.statusCode == 200){
        return response.data['func']; 
      }
    } on DioError catch (e){
      if (e.response != null){
        return null;
      } else {
        // ignore: avoid_print
        print(e);
      }
    }
  }
}