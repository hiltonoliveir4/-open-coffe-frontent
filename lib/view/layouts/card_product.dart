import 'package:flutter/material.dart';
import 'package:free_ticket_system_frontend/view/layouts/show_dialog.dart';

class BuildCard extends StatefulWidget{
  final String imgPath;
  final String price;
  final String name;
  final int id;
  const BuildCard({Key? key,
  required this.imgPath,
  required this.price,
  required this.id,
  required this.name})
  : super(key: key);

  @override
  _NewBuildCard createState() => _NewBuildCard(imgPath, price, name, id);
}

class _NewBuildCard extends State<BuildCard>{
  final String imgPath;
  final String price;
  final String name;
  final int id;
  var qtde = 0;

  _NewBuildCard(this.imgPath, this.price, this.name, this.id);

  @override
  Widget build(BuildContext context) {
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
          children: [
            Hero(
              tag: imgPath,
              child: Container(
                  height: 75.0,
                  width: 75.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(imgPath),
                          fit: BoxFit.contain)
                      )
                    )
            ),
            const SizedBox(height: 7.0),
            Text("R\$ $price",
              style: const TextStyle(
                  color: Color(0xFFFF2222),
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0)
            ),
            Text(name,
              style: const TextStyle(
                  color: Color(0xFF121212),
                  fontFamily: 'Montserrat',
                  fontSize: 14.0)
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(color: const Color(0xFFCCCCCC), height: 1.0)
            ),
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
          ],
      )
    )
  );
  }
}