import 'package:flutter/material.dart';
import 'package:free_ticket_system_frontend/view/layouts/show_dialog.dart';

class BuildCard extends StatefulWidget{
  final String price;
  final String name;
  final int id;
  final bool edit;
  const BuildCard({Key? key,
  required this.price,
  required this.id,
  required this.name,
  required this.edit,})
  : super(key: key);

  @override
  _NewBuildCard createState() => _NewBuildCard( price, name, id, edit);
}

class _NewBuildCard extends State<BuildCard>{
  final String price;
  final String name;
  final int id;
  final bool edit;
  var qtde = 0;
  final String baseurl = "http://ec2-3-85-228-15.compute-1.amazonaws.com:3000";

  _NewBuildCard(this.price, this.name, this.id, this.edit);

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    children.add(Hero(
        tag: name,
        child: SizedBox(
          height: 75.0,
          width: 75.0,
          child: Image.asset("assets/images/lasanha.png"),
        )
      )
    );

    children.add(
      const SizedBox(height: 7.0)
    );
    children.add(
      Text("R\$ $price",
        style: const TextStyle(
            color: Color(0xFFFF2222),
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
            fontSize: 16.0)
      )
    );
    children.add(
      Text(name,
        style: const TextStyle(
            color: Color(0xFF121212),
            fontFamily: 'Montserrat',
            fontSize: 14.0)
      ),
    );
    children.add(
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(color: const Color(0xFFCCCCCC), height: 1.0)
      ),
    );

    if(!edit){
      children.add(
        Padding(
          padding: const EdgeInsets.only(left: 5.0, right: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: (){
                  if(qtde > 0){
                    setState(() {
                      qtde--;
                    });
                  }
                }, 
                icon: const Icon(Icons.remove,
                    color: Color(0xFFFF2222), size: 12.0),
              ),
                Text('$qtde',
                    style: const TextStyle(
                    fontFamily: 'Montserrat',
                    color: Color(0xFFFF2222),
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0)),
              IconButton(
                onPressed: (){
                  setState(() {
                      qtde++;
                    });
                }, 
                icon: const Icon(Icons.add,
                    color: Color(0xFFFF2222), size: 12.0),
              ),
              ],
          ),
        ),
      );
      children.add(
        TextButton(
          onPressed: (){
            if(qtde > 0){
              showMyDialog("Produto adicionado ao carrinho", "", context);
              setState(() {
                qtde = 0;
              });
            } else {
              showMyDialog("Falha ao adicionar produto","A quantidade a ser adicionada no pedido não pode ser igual a 0", context);
            }
            
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 5.0, right: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Icon(Icons.shopping_basket,
                    color: Color(0xFFFF2222), size: 12.0),
                Text('Adicionar ao carrinho',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Color(0xFFFF2222),
                        fontSize: 12.0))
                  ]
                ),
          ),
        )
      );
    } else {
      children.add(
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: TextButton(
            onPressed: (){
              Navigator.pushNamed(context, '/edit-product', arguments: id);
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(Icons.edit,
                      color: Color(0xFFFF2222), size: 12.0),
                  Text('Editar',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Color(0xFFFF2222),
                          fontSize: 12.0))
                    ]
                  ),
            ),
          ),
        )
      );
    }

    return Padding(
    padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3.0,
              blurRadius: 5.0)
        ],
        color: Colors.white),
        child: Column(
          children: children
      )
    )
  );
  }
}