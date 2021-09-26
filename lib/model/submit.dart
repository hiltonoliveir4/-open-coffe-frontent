import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:free_ticket_system_frontend/view/layouts/show_dialog.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Submit{
  final String baseurl = "http://localhost:3000";

  submitCadastro(String name, String email, String password, BuildContext context) async {
    try{
      var response = await Dio().post(
        '$baseurl/account', 
        data: {
          'name': name,
          'email': email,
          'password': password
        }
      );
      if(response.statusCode == 201){
        Navigator.pushNamed(context, '/login');
      }
    } on DioError catch (e){
      if (e.response != null){
        showMyDialog("Erro", e.response.toString(), context);
      } else {
        // ignore: avoid_print
        print("ERRO!");
      }
    }
  }

  submitLogin(String email, String password, BuildContext context) async {
    try{
      var response = await Dio().put(
        '$baseurl/account/authenticate', 
        data: {
          'email': email,
          'password': password
        }
      );
      if(response.statusCode == 200){
        var token = response.data['token'];
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);
        await prefs.setString('email', email);
        Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
        var id = decodedToken['id'];
        var account = await Dio().get('$baseurl/account/$id', options: Options(
          headers: {'Authorization': 'Bearer $token'}
        ));
        if (account.data['account']['verified']){
          Navigator.pushNamed(context, '/user-home');
        } else {
          Navigator.pushNamed(context, '/autenticate');
        }
      }
    } on DioError catch (e){
      if (e.response != null){
        showMyDialog("Erro", e.response.toString(), context);
      } else {
        // ignore: avoid_print
        print("ERRO!");
      }
    }
  }

  sendEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var email = prefs.getString('email');
    try{
      await Dio().post(
          '$baseurl/account/sent_verify', data:{'email': email}, 
          options: Options(
            headers: {'Authorization': 'Bearer $token'}
          )
        );
    } catch (e){
      // ignore: avoid_print
      print(e);
    }
    
  }

  submiteAutentiacteCode(String code, BuildContext context) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    try{
      var response = await Dio().post(
        '$baseurl/account/confirm_account', 
        data: {
          'email': prefs.getString('email'),
          'validate_code': code
        }, options: Options(headers: {'Authorization': 'Bearer $token'})
      );
      
      if(response.statusCode == 200){
        Navigator.pushNamed(context, '/user-home');
      }

    } on DioError catch (e){
      if (e.response != null){
        showMyDialog("Erro", e.response.toString(), context);
      } else {
        // ignore: avoid_print
        print("ERRO!");
      }
    }
  }
}
