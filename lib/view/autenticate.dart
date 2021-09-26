// ignore_for_file: must_call_super

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:free_ticket_system_frontend/model/submit.dart';

class Autenticate extends StatefulWidget {
  const Autenticate({Key? key}) : super(key: key);

  @override
  _NewAutenticate createState() => _NewAutenticate();
}

class _NewAutenticate extends State<Autenticate>{
  final autenticateFormKey = GlobalKey<FormState>();
  final autenticate = TextEditingController();

  @override
  void initState() {
    Submit().sendEmail();
  }

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
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Autenticar"),
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: SizedBox(
              width: 10,
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Image.asset('assets/images/logo_sem_icone.png'),
              ),
            ) 
          ),
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
                      Submit().submiteAutentiacteCode(autenticate.text, context);
                    },
                  ),
                ),
            ),
            const SizedBox(height: 10),
            Container(
                decoration: const BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.all(
                      Radius.circular(40.0),
                    )),
                width: 180.0,
                height: 45.0,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: TextButton(
                    child: const Text(
                      "Reenviar email",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Submit().sendEmail();
                    },
                  ),
                ),
            )
          ],
        ),
      )
    );
  }
}