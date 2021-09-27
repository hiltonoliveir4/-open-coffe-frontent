import 'package:flutter/material.dart';

// ignore: todo
//TODO: FAZER UPDATE DO AVISO PRA QUANDOR TIVER UMA FALHA OU NÃO

Future<void> showMyDialog(String title, String content, context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.red.shade900,
        title: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(title, 
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontFamily: 'Montserrat',
                color: Colors.white
              ),),
          ),
        content: SingleChildScrollView(
          child: content != "" ? 
          Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16.0),
                  )
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(content, 
                style: const TextStyle(
                    fontSize: 12,
                    fontFamily: 'Montserrat',
                    color: Color(0xFFDDDDDD)
                  ),),
              ),
          ) : Container(),
        ),
        actions: [
          Container(
            height: 30,
            width: 70,
            decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(40.0),
                    )),
            child: TextButton(
              child: Text(
                'OK',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  fontFamily: 'Montserrat',
                  color: Colors.red.shade900
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          )
        ],
      );
    },
  );
}
