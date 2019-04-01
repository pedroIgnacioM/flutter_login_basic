import 'package:flutter/material.dart';


class LoginScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final title = 'Login';

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: LoginForm(),
    );
  }
}

class LoginForm extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LoginFormState();
  }
}

class LoginFormState extends State<LoginForm>{
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 5.0),
              child: usernameField(),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 5.0),
              child: passwordField(),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(bottom: 5.0),
                child: submitButton(),
              ),
            ),
          ],
        ),
      )
    );
  }

  TextFormField usernameField(){
    return TextFormField(
      autofocus: true,
      decoration: InputDecoration(
        hintText: 'Username'
      ),
      validator: (value) {
        if (value.isEmpty){
          return 'Este campo no puede estar vacio';
        }
      },
    );
  }

  TextFormField passwordField(){
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'password'
      ),
      validator: (value) {
        if (value.isEmpty){
          return 'Este campo no puede estar vacio';
        }
      },
      obscureText: true,
    );
  }

  RaisedButton submitButton(){
    return RaisedButton(
      onPressed: () {
        if (_formKey.currentState.validate()){
          Scaffold.of(context).showSnackBar(SnackBar(content: Text('Cargando')));
        }
      },
      child: Text('Iniciar sesión'),
    );
  }
}