import 'package:flutter/material.dart';
import 'package:free_ticket_system_frontend/model/getter.dart';
import 'package:free_ticket_system_frontend/model/logout.dart';

import 'layouts/card_product.dart';

class RestaurantPage extends StatefulWidget{
  const RestaurantPage({Key? key}) : super(key: key);

  @override
  _NewRestaurantPage createState() => _NewRestaurantPage();
}

class _NewRestaurantPage extends State<RestaurantPage>{
  @override
  Widget build(BuildContext context) {
    final idRestaurant = ModalRoute.of(context)!.settings.arguments;
    return FutureBuilder(
      future: Getter().getFullRestaurant(idRestaurant.toString(), context),
      builder: (BuildContext context, AsyncSnapshot restaurant){
        List<Widget> children = [];
        if(restaurant.hasData){
          var restaurante = restaurant.data['restaurante'];
          List produtos = restaurant.data['produtos'];
          children.add(
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('${restaurante['name']}', style: const TextStyle(
                      fontFamily: 'Montserrat',
                      color: Color(0XFF121212),
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        gradient: const LinearGradient(
                          colors: [Colors.red, Colors.pink],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight
                        ),
                    ),
                    child: InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, '/edit-restaurant', arguments: idRestaurant);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            // Text( "Editar", style: TextStyle(
                            //     fontFamily: 'Montserrat',
                            //     color: Colors.white,
                            //     fontWeight: FontWeight.bold,
                            //     fontSize: 12,
                            //   )
                            // ),
                            Icon(Icons.edit, size: 20, color: Colors.white,)
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
          children.add(
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('${restaurante['description']}', style: const TextStyle(
                  fontFamily: 'Montserrat',
                  color: Color(0XFF121212),
                  fontSize: 15,
                )
              ),
            ),
          );

          children.add(
            const Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 8.0, left: 8.0, right: 8.0),
              child: Text('Meus produtos', style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Color(0XFF121212),
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                )
              ),
            ),
          );

          children.add(
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row( mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 8.0),
                    child: Container(
                      height: 50,
                      width: 150,
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
                          Navigator.pushNamed(context, '/add-produto', arguments: idRestaurant);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text( "Produto", style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              )
                            ),
                            Icon(Icons.add, size: 20, color: Colors.white,)
                          ],
                        ),
                      ),
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 8.0),
                    child: Container(
                      height: 50,
                      width: 150,
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
                          Navigator.pushNamed(context, '/add-func', arguments: idRestaurant);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text( "Funcionário", style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              )
                            ),
                            Icon(Icons.add, size: 20, color: Colors.white,)
                          ],
                        ),
                      ),
                    )
                  ),
                ],
              ),
            )
          );
          
          List<Widget> childrenProdutos = [];
          produtos.toList().forEach((item) {
            childrenProdutos.add(BuildCard(price: item['preco'], id: item['id'], name: item['name'], edit: true));
          });

          children.add(
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: childrenProdutos,
              ),
            )
          );
        } else {
          children.add(
            const Padding(
              padding: EdgeInsets.only(top: 50.0),
              child: Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                  strokeWidth: 7.0,
                ),
              ),
            )
          );
        }
        children.add(const SizedBox(height: 15,));
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
            ),
          ),
        );
      }
    );
  }
}