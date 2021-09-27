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
  _NewBuildCard createState() => _NewBuildCard(price, name, id, edit);
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

    children.add(
      Text("R\$ $price",
        style: const TextStyle(
            color: Color(0xFFFFFFFF),
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
            fontSize: 20.0)
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
                    color: Color(0xFFFFFFFF), size: 18.0),
              ),
                Text('$qtde',
                    style: const TextStyle(
                    fontFamily: 'Montserrat',
                    color: Color(0xFFFFFFFF),
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0)),
              IconButton(
                onPressed: (){
                  setState(() {
                      qtde++;
                    });
                }, 
                icon: const Icon(Icons.add,
                    color: Color(0xFFFFFFFF), size: 18.0),
              ),
              ],
          ),
        ),
      );
      children.add(
        TextButton(
          onPressed: (){
            if(qtde > 0){
              showMyDialog("Produto adicionado ao pedido", "", context);
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(Icons.shopping_basket,
                    color: Color(0xFF121212), size: 12.0),
                Text('Adicionar ao pedido',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF121212),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(Icons.edit,
                      color: Color(0xFFFFFFFF), size: 12.0),
                  SizedBox(width: 5,),
                  Text('Editar',
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Color(0xFFFFFFFF),
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold))
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
        decoration: 
          BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: const LinearGradient(
              colors: [Colors.yellow, Colors.orange],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.orange,
                blurRadius: 12,
                offset: Offset(0,6),
              )
            ]
          ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: children
              ),
            ),
            const Icon(Icons.restaurant_outlined, 
              size: 35,
              color: Colors.white,)
          ],
        ),
      )
    );
  }
}