import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'previousRoute.dart';

class Home extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent[700],
      appBar: AppBar(
        backgroundColor: Colors.redAccent[700],
        title: Text('Torção de Vigas'),
      ),
      body: MenuButtons(),
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Text('Menu'),
          backgroundColor: Colors.red[600]),
    );
  }
}

class MenuButtons extends StatelessWidget {
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(height: 30),
          ButtonTheme(
            buttonColor: Colors.black,
            minWidth: 200,
            child: RaisedButton(
                onPressed: () {
                  //Enviar
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondRoute()),
                  );
                },
                child: Text('Cálculo',
                    style: TextStyle(fontSize: 20, color: Colors.white))),
          ),
          SizedBox(height: 30),
          ButtonTheme(
              buttonColor: Colors.black,
              minWidth: 200,
              child: RaisedButton(
                onPressed: () {},
                child: Text('Configurações',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              )),
          SizedBox(height: 30),
          ButtonTheme(
              buttonColor: Colors.redAccent[700],
              minWidth: 200,
              child: RaisedButton(
                onPressed: () {},
                child: Text('Créditos',
                    style: TextStyle(fontSize: 20, color: Colors.white)),
              )),
        ],
      ),
    );
  }
}
