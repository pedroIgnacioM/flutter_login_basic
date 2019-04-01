import 'package:flutter/material.dart';
import 'ui/home_page.dart';

class App extends StatelessWidget{

  @override
  Widget build(BuildContext context){

    return MaterialApp(
      home: Scaffold(
        body: HomePage(),
      ),
    );

  }

}

