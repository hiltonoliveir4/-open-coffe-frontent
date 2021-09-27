import 'package:flutter/material.dart';
import 'package:free_ticket_system_frontend/model/getter.dart';
import 'package:free_ticket_system_frontend/view/layouts/card_info.dart';
import 'package:free_ticket_system_frontend/view/layouts/card_product.dart';

class MeuTrabalho extends StatefulWidget{
  const MeuTrabalho({Key? key}) : super(key: key);

  @override
  _NewMeuTrabalho createState() => _NewMeuTrabalho();
}

class _NewMeuTrabalho extends State<MeuTrabalho>{
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Getter().getMeuTrabalho(context),
      builder: (BuildContext context, AsyncSnapshot productList){
        List<Widget> children = [];
        if(productList.hasData){
          if(productList.data.toList().length > 0){
            productList.data.toList().forEach((item) {
              children.add(
                BuildCard(
                  name:item['name'],
                  price: item['preco'],
                  id: item['id'],
                  edit: false
                )
              );
            });
          } else {
            children.add(
              const CardInfo(
                type: "",
                routeName: "/autenticate-func",
                param: null,
                title: "Você tem uma nova solicitação de trabalho!",
                description: "Verifique o seu email e confirme aqui."
              )
            );
          }
          
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
                    children: children
                  )
              ),
            ],
          ),
        );
      }
    );
  }
}