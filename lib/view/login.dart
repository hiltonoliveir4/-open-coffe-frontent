import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _NewLogin createState() => _NewLogin();
}

class _NewLogin extends State<Login> {
  bool _showPassword = false;
  final _formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void _submit(String login, String senha) {
    //envia login e senha pra api
    print("$login - $senha");
  }

  @override
  void dispose(){
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final _keyform = GlobalKey<FormState>();

    Widget _formLogin(){
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                      return 'Insira o email';
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
                      "LOGIN",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      //enviar para a api e mostrar o circular progress bar
                      _submit(email.text, password.text);
                      Navigator.pushNamed(context, '/user-home');
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
                      "CADASTRE-SE",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                  ),
                ),
              ),
            ],
          )
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Login"),
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

      // ignore: todo
      //TODO: ADICIONAR FUTURE BUILDER PARA LOGIN QUANDO FOR USAR A API!
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              width: 300,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('images/logo_sem_icone.png'),
              ),
            ),
          _formLogin(),
        ],
      )
    );
  }
}
