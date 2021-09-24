import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _NewRegister createState() => _NewRegister();
}

class _NewRegister extends State<Register> {
  bool _showPassword = false;
  bool _showConfirmPassword = false;
  final _formKey = GlobalKey<FormState>();

  final nome = TextEditingController();
  final email = TextEditingController();
  final confirmPassword = TextEditingController();
  final password = TextEditingController();

  _submit(String nome, String email, String senha){
    // ignore: avoid_print
    print("$nome, $email, $senha");
  }

  @override
  void dispose(){
    nome.dispose();
    email.dispose();
    password.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget _formCadastro(){
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: nome,
                    autofocus: false,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                            Icons.person,
                            color: Colors.red,
                          ),
                      hintText: "Nome",
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
                        return 'Insira o seu nome';
                      } 
                      return null;
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: email,
                    autofocus: false,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                            Icons.mail,
                            color: Colors.red,
                          ),
                      hintText: "Email",
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
                        return 'Insira o Email';
                      } 
                      return null;
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: password,
                    autofocus: false,
                    obscureText: _showPassword == false ? true : false,
                    decoration: InputDecoration(
                      hintText: "Senha",
                      prefixIcon: const Icon(
                            Icons.lock,
                            color: Colors.red,
                          ),
                      suffixIcon: GestureDetector(
                            child: Icon(
                                _showPassword == false
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.red),
                            onTap: () {
                              setState(() {
                                _showPassword = !_showPassword;
                              });
                            },
                          ),
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
                        return 'Insira a senha';
                      }
                      return null;
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: confirmPassword,
                    autofocus: false,
                    obscureText: _showConfirmPassword == false ? true : false,
                    decoration: InputDecoration(
                      hintText: "Confirme a senha",
                      prefixIcon: const Icon(
                            Icons.lock,
                            color: Colors.red,
                          ),
                      suffixIcon: GestureDetector(
                            child: Icon(
                                _showConfirmPassword == false
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.red),
                            onTap: () {
                              setState(() {
                                _showConfirmPassword = !_showConfirmPassword;
                              });
                            },
                          ),
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
                      if(value == null || password.text != confirmPassword.text){
                        return 'As senhas não são iguais';
                      }
                      return null;
                    },
                  ),
                ),
                
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(
                        Radius.circular(40.0),
                      )),
                  width: 220.0,
                  height: 45.0,
                  margin: const EdgeInsets.all(10.0),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: TextButton(
                      child: const Text(
                        "CADASTRAR",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          //enviar para a api e mostrar o circular progress bar
                          _submit(nome.text, email.text, password.text);
                          Navigator.pushNamed(context, '/autenticate');
                        }
                      },
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.black45,
                      borderRadius: BorderRadius.all(
                        Radius.circular(40.0),
                      )),
                  width: 220.0,
                  height: 45.0,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: TextButton(
                      child: const Text(
                        "LOGIN",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                    ),
                  ),
                ),
              ],
            )
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Cadastre-se"),
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
          ),
        ),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              width: 300,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('assets/images/logo_sem_icone.png'),
              ),
            ),
          _formCadastro(),
        ],
      )
    );
  }

}