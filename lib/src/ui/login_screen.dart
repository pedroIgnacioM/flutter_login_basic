import 'package:flutter/material.dart';
import 'home_page.dart';

class LoginScreen extends StatelessWidget{
  BuildContext context;

  @override
  Widget build(BuildContext contex){
    this.context = contex;
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Column(
        children: <Widget>[
          loginBox(),
        ],
      )
    );
  }

  Widget loginBox(){
    return Container(
        margin: EdgeInsets.all(20.0),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black)
        ),
        child: Column(
          children: <Widget>[
            usernameField(),
            passwordField(),
            submitButton(),
          ],
        ),
      );
  }

  Widget usernameField(){
    return TextField(
      decoration: InputDecoration(
        labelText: 'Username',
      ),
    );
  }

  Widget passwordField(){
    return TextField(
      decoration: InputDecoration(
        hintText: 'Debe contener almenos 8 carácteres',
        labelText: 'Password',
      ),
      obscureText: true,
    );
  }

  Widget submitButton(){
    return RaisedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage())
        );
      },
      textColor: Colors.white,
      padding: EdgeInsets.all(1.0),
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Text('Iniciar sesión'),
      ),
    );
  }

}