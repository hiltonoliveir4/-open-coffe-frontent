import 'package:flutter/material.dart';
import 'package:free_ticket_system_frontend/model/submit.dart';

class AddFuncionario extends StatefulWidget{
  const AddFuncionario({Key? key}) : super(key: key);

  @override
  _NewAddFuncionario createState() => _NewAddFuncionario();
}

class _NewAddFuncionario extends State<AddFuncionario>{
  final _formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final _roles = ['Garçom'];
  var _role = 'Garçom';

  Widget _formAddFuncionario(){
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: email,
                autofocus: false,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                        Icons.person,
                        color: Colors.red,
                      ),
                  hintText: "Email do funcionário",
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
                    return 'Insira o email do funcionário';
                  } 
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton<String>(
                items: _roles.map((String dropDownStringItem) {
                  return DropdownMenuItem<String>(
                    value: dropDownStringItem,
                    child: Text(dropDownStringItem),
                    );
                }).toList(),
                onChanged: (String? novoItemSelecionado) {
                  setState(() {
                    _role = novoItemSelecionado!;
                  });
                },
                value: _role
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final idRestaurant = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
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
      body: SingleChildScrollView(
        child: Column(
          children: [ 
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text('Adicionar novo funcionário',
                style: TextStyle(
                  color: Color(0XFF22272E),
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w900,
                  fontSize: 30
                ),
              ),
            ),
            _formAddFuncionario(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 8.0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                gradient: const LinearGradient(
                  colors: [Colors.green, Colors.lightGreen],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.green,
                    blurRadius: 12,
                    offset: Offset(0,6),
                  )
                ]
              ),
                child: InkWell(
                  splashColor: Colors.green,
                  onTap: (){
                    if (_formKey.currentState!.validate()) {
                      Submit().submitNewFunc(email.text, _role, idRestaurant.toString(), context);
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text( "Enviar Convite", style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        )
                      ),
                      Icon(Icons.add, size: 40, color: Colors.white,)
                    ],
                  ),
                ),
              )
            )
          ],
        ),
      ),
    );
  }

}