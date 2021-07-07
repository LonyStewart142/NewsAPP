import 'package:flutter/material.dart';

  List<int> getRGB(Color c) {
  return [c.red,c.green, c.blue];
  }

void mostrarAlerta(BuildContext context,String mensaje){

  showDialog(
    context: context, 
    builder: (context){
      return AlertDialog(
        title: Text('Informacion Incorrecta'),
        content: Text(mensaje),
        actions: <Widget>[
          FlatButton(
            onPressed: ()=>Navigator.of(context).pop(),
            child: Text('Ok')
            )
        ],
      );
    });
}