import 'package:flutter/material.dart';

class CardInfo extends StatelessWidget{
  final String title;
  final String description;
  final String type;
  final String routeName;
  // ignore: prefer_typing_uninitialized_variables
  final param;

  const CardInfo({
    Key? key, 
    required this.type, 
    required this.routeName, 
    required this.param,
    required this.title,
    required this.description
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color pColor = type == 'info' ? Colors.blue : type == 'sucess' ? Colors.green : type == 'danger' ? Colors.red : Colors.white;
    final Color sColor = type == 'info' ? Colors.purple : type == 'sucess' ? Colors.cyan : type == 'danger' ? Colors.pink : Colors.white;

    return Card(
      color: Colors.transparent,
      elevation: 0,
      child: InkWell(
        splashColor: pColor,
        onTap: (){
          // ignore: todo
          Navigator.pushNamed(context, routeName); //TODO: enviar parametro
        },
        child: Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: LinearGradient(
                colors: [sColor, pColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight
              ),
              boxShadow: [
                BoxShadow(
                  color: pColor,
                  blurRadius: 12,
                  offset: const Offset(0,6),
                )
              ]
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(title, style: const TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),),
                      Text(description, style: const TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontSize: 15,
                      ),),
                      const Text("Clique para ver mais", style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),)
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.collections_bookmark_rounded,
                    size: 35,
                    color: Colors.white,
                  ),
                )
              ],
            ),
        ),
      ),
    );
  }

}