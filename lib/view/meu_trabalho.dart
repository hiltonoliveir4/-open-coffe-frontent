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
            if(productList.data.toList()[0] == 500){
              children.add(
                const Padding(
                  padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: Text('Ainda não há solicitação de trabalhos para você', style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Color(0XFF121212),
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                      )
                  ),
                    ),
                ),
              );
            } else {
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
            }
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
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView(
              children: children,
            ),
          ),
        );
      }
    );
  }
}