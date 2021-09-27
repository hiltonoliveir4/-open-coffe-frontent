import 'package:flutter/material.dart';
import 'package:free_ticket_system_frontend/model/logout.dart';

Future showMyDialogLoggof(context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.red.shade900,
        title: const Padding(
            padding: EdgeInsets.all(4.0),
            child: Text("Você deseja sair?", 
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontFamily: 'Montserrat',
                color: Colors.white
              ),),
          ),
        actions: [
          SizedBox(
            height: 30,
            width: 70,
            child: TextButton(
              child: const Text(
                'Cancelar',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                  fontFamily: 'Montserrat',
                  color: Colors.white
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          Container(
            height: 30,
            width: 70,
            decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(40.0),),
                    color: Colors.white
            ),
            child: TextButton(
              child: Text(
                'Sair',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                  fontFamily: 'Montserrat',
                  color: Colors.red.shade900
                ),
              ),
              onPressed: () {
                confirmedLoggout(context);
              },
            ),
          ),
        ],
      );
    },
  );
}