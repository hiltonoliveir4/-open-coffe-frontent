import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:free_ticket_system_frontend/model/submit.dart';

class AutenticateFunc extends StatefulWidget {
  const AutenticateFunc({Key? key}) : super(key: key);

  @override
  _NewAutenticateFunc createState() => _NewAutenticateFunc();
}

class _NewAutenticateFunc extends State<AutenticateFunc>{
  final autenticateFormKey = GlobalKey<FormState>();
  final autenticate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Widget formAutenticate(){
      return Form(
          key: autenticateFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: autenticate,
                    autofocus: false,
                    maxLength: 4,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                            Icons.confirmation_number,
                            color: Colors.red,
                          ),
                      hintText: "0000",
                      border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red.shade200),
                            borderRadius: BorderRadius.circular(25.7),
                          ),
                      enabledBorder:
                          OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red.shade200),
                            borderRadius: BorderRadius.circular(25.7),
                          ),
                      focusedBorder:
                          OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(25.7),
                          ),
                        ),
                    validator: (value) {
                      if(value == null || value.isEmpty){
                        return 'Insira a chave enviada para o seu email';
                      } 
                      return null;
                    },
                  ),
              ),
            ],
          ),
      );
    }
    
    return Scaffold(
      appBar: 
      AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: const Color(0XFF121212),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            onPressed: (){},
            color: const Color(0XFF121212),
            icon: const Icon(Icons.notifications_none)
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            SizedBox(
              width: 300,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('assets/images/logo_sem_icone.png'),
              ),
            ),
            const Text(
              "Insira o código que foi enviado para o seu email:",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            formAutenticate(),
            Container(
                decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(
                      Radius.circular(40.0),
                    )),
                width: 250.0,
                height: 45.0,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: TextButton(
                    child: const Text(
                      "Confirmar Cadastro",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Submit().submiteAutenticateCodeFunc(autenticate.text, context);
                    },
                  ),
                ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      )
    );
  }
}