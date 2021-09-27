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
                fontSize: 30
              ),
            ),
          ),
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
                  Navigator.pushNamed(context, '/add-restaurante');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text( "Adicionar novo", style: TextStyle(
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
        ];
        if(listRestaurantes.hasData){
          listRestaurantes.data.toList().forEach((lanchonete){
            children.add(
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
                  child: CardInfo(
                    title: "${lanchonete['name']}",
                    description: "${lanchonete['description']}",
                    routeName: "/restaurant",
                    type: "danger",
                    param: "${lanchonete['id']}",
                  ),
                )
            );
          });
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