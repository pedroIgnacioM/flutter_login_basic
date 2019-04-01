import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  BuildContext context;
  @override
  Widget build(BuildContext context){
    this.context = context;
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido'),
      ),
      body: Column(
        children: <Widget>[
          Text('Se encuentra autentificado con éxito'),
          logoutButton(),
        ],
      ),
    );
  }

  Widget logoutButton(){
    return RaisedButton(
      onPressed: (){
        Navigator.pop(context);
      },
      textColor: Colors.white,
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Text('Cerrar sesión'),
      ),
    );
  }
}