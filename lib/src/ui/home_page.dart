import 'package:flutter/material.dart';
import 'login_screen.dart';

class HomePage extends StatelessWidget{

  @override  
  Widget build(BuildContext context){  
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Text('Bienvenido a la App básica con login.'),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 15.0),
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginScreen()),
                        );
                      },
                      padding: EdgeInsets.all(10.0),
                      child: Text('Iniciar sesión'),
                    )
                  ),
                  
                  RaisedButton(
                    onPressed: () {},
                    padding: EdgeInsets.all(10.0),
                    child: Text('No hacer nada'),
                  )
                ],
              ),
            ),
            
          ],
        ),
      )
    );
  }
}