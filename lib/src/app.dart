import 'package:flutter/material.dart';
import 'ui/login_screen.dart';

class App extends StatelessWidget{

  @override
  Widget build(BuildContext context){

    return MaterialApp(
      home: Scaffold(
        body: LoginScreen(),
      ),
    );

  }

}

