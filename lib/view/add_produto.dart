import 'package:flutter/material.dart';
import 'package:free_ticket_system_frontend/model/logout.dart';
import 'package:free_ticket_system_frontend/model/submit.dart';

class AddProduto extends StatefulWidget {
  const AddProduto({ Key? key }) : super(key: key);

  @override
  _AddProdutoState createState() => _AddProdutoState();
}

class _AddProdutoState extends State<AddProduto> {
  final _formKey = GlobalKey<FormState>();
  final nome = TextEditingController();
  final descricao = TextEditingController();
  final preco = TextEditingController();

  @override
  void dispose(){
    nome.dispose();
    descricao.dispose();
    preco.dispose();
    super.dispose();
  }

  Widget _formAddProduto(){
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                maxLength: 25,
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
                    return 'Insira um nome para o produto';
                  } 
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                maxLength: 200,
                controller: descricao,
                autofocus: false,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                        Icons.person,
                        color: Colors.red,
                      ),
                  hintText: "Descrição",
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
                    return 'Insira uma descrição para o produto';
                  } 
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: preco,
                autofocus: false,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                        Icons.person,
                        color: Colors.red,
                      ),
                  hintText: "Preço",
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
                    return 'Insira um nome para o produto';
                  } 
                  return null;
                },
              ),
            ),
          ],
        )
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
            onPressed: (){
              loggout(context);
            },
            color: const Color(0XFF121212),
            icon: const Icon(Icons.logout)
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text('Adicionar novo produto',
                style: TextStyle(
                  color: Color(0XFF22272E),
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w900,
                  fontSize: 30
                ),
              ),
            ),
            _formAddProduto(),
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
                      Submit().submitNewProduct(nome.text, descricao.text, preco.text, context, idRestaurant.toString());
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text( "Cadastrar Produto", style: TextStyle(
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

// nome
// descricao
// preco
// idLanchonete
// foto