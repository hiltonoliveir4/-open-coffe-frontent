import 'package:flutter/material.dart';
import 'package:free_ticket_system_frontend/view/layouts/card_product.dart';

class ProductPage extends StatefulWidget{
  const ProductPage({Key? key}) : super(key: key);

  @override
  _NewProductPage createState() => _NewProductPage();
}

class _NewProductPage extends State<ProductPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(height: 15.0,),
          Container(
            padding: const EdgeInsets.only(right: 5.0, left: 5.0, bottom: 75.0),
              width: MediaQuery.of(context).size.width - 30.0,
              height: MediaQuery.of(context).size.height - 50.0,
              child: GridView.count(
                crossAxisCount: 2,
                primary: false,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 15.0,
                childAspectRatio: 0.8,
                children:const [
                  BuildCard(name:"Lasanha", price: "7.00", imgPath: "assets/images/lasanha.png"),
                  BuildCard(name:"Lasanha", price: "7.00", imgPath: "assets/images/lasanha.png"),
                  BuildCard(name:"Lasanha", price: "7.00", imgPath: "assets/images/lasanha.png"),
                  BuildCard(name:"Lasanha", price: "7.00", imgPath: "assets/images/lasanha.png"),
                  BuildCard(name:"Lasanha", price: "7.00", imgPath: "assets/images/lasanha.png"),
                  BuildCard(name:"Lasanha", price: "7.00", imgPath: "assets/images/lasanha.png"),
                  BuildCard(name:"Lasanha", price: "7.00", imgPath: "assets/images/lasanha.png"),
                  BuildCard(name:"Lasanha", price: "7.00", imgPath: "assets/images/lasanha.png"),
                  BuildCard(name:"Lasanha", price: "7.00", imgPath: "assets/images/lasanha.png"),
                ]
              )
          ),
        ],
      ),
      floatingActionButton: 
        FloatingActionButton(
          onPressed: (){
            //ir para o carrinho e levar os dados adicionados
          },
          child: const Icon(Icons.shopping_cart),
          backgroundColor: const Color(0xFFFF2222),
        ),
    );
  }
}