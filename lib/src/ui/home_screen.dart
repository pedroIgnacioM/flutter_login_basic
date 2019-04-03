import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'sign_in_screen.dart';
import '../Database.dart';
import '../models/User.dart';

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
              child: Text('Bienvenido a la App básica con login .'),
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
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignInScreen()),
                      );
                    },
                    padding: EdgeInsets.all(10.0),
                    child: Text('Registrarse'),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 5.0),
              child: FutureBuilder<List<User>>(
                future: DBProvider.db.getAllUsers(),
                builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
                  if (snapshot.hasData) {
                    return Text("Hola ${snapshot.data.last.username} \nPass: ${snapshot.data.last.password}");
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }
              )
            ),
          ],
        ),
      )
    );
  }
}