import 'package:flutter/material.dart';
import '../Database.dart';
import '../models/User.dart';

class SignInScreen extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Creación de cuenta'),
      ),
      body: SignInForm(),
    );
  }
}

class SignInFormState extends State<SignInForm> {

  final _formKey = GlobalKey<FormState>();
  final userTextController = TextEditingController();
  final passTextController =TextEditingController();

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
      ),
    );
  }

  @override
  void dispose(){
    userTextController.dispose();
    passTextController.dispose();
    super.dispose();
  }

  TextFormField usernameField(){
    return TextFormField(
      controller: userTextController,
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
      controller: passTextController,
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
          final newUser = DBProvider.db.createUser(User(userTextController.text, passTextController.text));
          if (newUser != null) {
            Navigator.pop(context);
          }else{
            Scaffold.of(context).showSnackBar(SnackBar(content: Text('Error')));
          }
        }
      },
      child: Text('Registrarse'),
    );
  }
}

class SignInForm extends StatefulWidget{
  
  @override
  State<StatefulWidget> createState() {
    return SignInFormState();
  }
}