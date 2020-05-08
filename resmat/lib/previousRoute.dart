import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class secondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            //Voltar
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}