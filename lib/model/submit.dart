import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:free_ticket_system_frontend/model/getter.dart';
import 'package:free_ticket_system_frontend/view/layouts/show_dialog.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Submit{
  final String baseurl = "http://ec2-3-85-228-15.compute-1.amazonaws.com:3000";

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
        prefs.clear();
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

  submitNewRestaurant(String name, String description, BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var email = prefs.getString('email');
    try{
      var response = await Dio().post(
        '$baseurl/lanchonete', 
        data: {
          'name': name,
          'description': description,
          'email': email,
        }, options: Options(headers: {'Authorization': 'Bearer $token'})
      );
      
      if(response.statusCode == 201){
        showMyDialog("Restaurante adicionado com sucesso!", "", context);
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

  submitEditedRestaurant(String name, String description, String idRestaurante, BuildContext context) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    try{
      var response = await Dio().put(
        '$baseurl/lanchonete', 
        data: {
          'name': name,
          'description': description,
          'lanchoneteId': idRestaurante,
        }, options: Options(headers: {'Authorization': 'Bearer $token'})
      );

      if(response.statusCode == 201){
        showMyDialog("Restaurante adicionado com sucesso!", "", context);
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

  submitNewFunc(String email, String role, String idRestaurante, BuildContext context) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');

    if(role == 'Garçom'){
      role = 'garcom';
    }

    try{
      var response = await Dio().post(
        '$baseurl/funcionario', 
        data: {
          'func_role': role,
          'func_email': email,
          'lanchonete_id': idRestaurante,
        }, options: Options(headers: {'Authorization': 'Bearer $token'})
      );

      if(response.statusCode == 201){
        showMyDialog("Funcionário Cadastrado!", "O funcionário receberá um email informando o código de validação.", context);
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

  submitNewProduct(String name, String descricao, String preco, BuildContext context, String idRestaurante) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');

    var formData = FormData.fromMap({
      'name': name,
      'description': descricao,
      'preco': preco,
      'lanchonete_id': idRestaurante,
    });

    try{
      var response = await Dio().post(
        '$baseurl/produto', 
        data: formData, 
        options: Options(headers: {'Authorization': 'Bearer $token'})
      );

      if(response.statusCode == 201){
        Navigator.pushNamed(context, '/restaurant', arguments: idRestaurante);
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

  submitEditProduct(String name, String descricao, String preco, BuildContext context, String idRestaurante, String idProduto) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');

    var formData = FormData.fromMap({
      'name': name,
      'description': descricao,
      'preco': preco,
      'lanchonete_id': idRestaurante,
      'product_id': idProduto, 
    });

    try{
      var response = await Dio().put(
        '$baseurl/produto', 
        data: formData, 
        options: Options(headers: {'Authorization': 'Bearer $token'})
      );

      if(response.statusCode == 200){
        Navigator.pushNamed(context, '/restaurant', arguments: idRestaurante);
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

  submiteAutenticateCodeFunc(String code, BuildContext context) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');

    try{
      var funcLine = await Getter().getFuncLine(context);
      var funcLineId = funcLine['id'];
      var response = await Dio().put(
        '$baseurl/funcionario', 
        data: {
          'validation_code': code,
          'func_line_id': funcLineId,
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
