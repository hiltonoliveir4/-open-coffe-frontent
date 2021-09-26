import 'package:flutter/material.dart';
import 'package:free_ticket_system_frontend/model/getter.dart';
import 'package:free_ticket_system_frontend/view/layouts/card_info.dart';

class MeusRestaurantes extends StatefulWidget{
  const MeusRestaurantes({Key? key}) : super(key: key);

  @override
  _NewMeusRestaurantes createState() => _NewMeusRestaurantes();
}

class _NewMeusRestaurantes extends State<MeusRestaurantes>{
  final List restaurantes = [];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Getter().getMeuRestaurantes(context),
      builder: (BuildContext context, AsyncSnapshot listRestaurantes){
        List<Widget> children = [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text('Meus Restaurantes',
              style: TextStyle(
                color: Color(0XFF22272E),
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w900,
                fontSize: 25
              ),
            ),
          )
        ];
        if(listRestaurantes.hasData){
          listRestaurantes.data.toList().forEach((lanchonete){
            children.add(
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
                  child: CardInfo(
                    title: "${lanchonete['name']}",
                    description: "${lanchonete['description']}",
                    routeName: "teste",
                    type: "danger",
                    param: "teste",
                  ),
                )
            );
          });
        } else {
          children.add(
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: CircularProgressIndicator(
                color: Colors.red,
                strokeWidth: 8.0,
              ),
            )
          );
        }

        children.add(const SizedBox(height: 15,));

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          ),
        );
      }
    );
  }
}